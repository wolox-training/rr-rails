require 'rails_helper'

describe Api::V1::BooksController do
  describe 'GET #index', type: :request do
    include_context 'when logged in'

    let! :books do
      create_list(:book, 3)
    end

    before do
      get api_v1_books_path
    end

    it 'responds with a list of books' do
      expected = ActiveModel::Serializer::CollectionSerializer.new(books).to_json
      expect(response.body) =~ JSON.parse(expected)
    end

    it 'responds with 200 status' do
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #show', type: :request do
    include_context 'when logged in'

    let!(:book) do
      create(:book)
    end

    before do
      get api_v1_book_path(book.id)
    end

    it 'responds with the book json' do
      expect(response.body).to eq BookSerializer.new(
        book, root: false
      ).to_json
    end

    it 'responds with 200 status' do
      expect(response).to have_http_status(:success)
    end
  end
end
