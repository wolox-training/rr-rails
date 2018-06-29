require 'rails_helper'

describe Api::V1::BooksController do
  describe '#index' do
    it 'gets a list of books' do
      include_context 'when logged in'
      get '/api/v1/books'
      expect(response).to have_http_status(:success)
    end
  end
  describe '#show' do
    include_context 'when logged in'
  end
end
