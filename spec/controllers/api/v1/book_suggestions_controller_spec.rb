require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #index', type: :request do
    subject(:make_suggestion) do
      params = { book_suggestion: new_suggestion_attributes }
      post api_v1_book_suggestions_path, params: params
    end

    let(:new_suggestion_attributes) { attributes_for(:book_suggestion) }

    context 'when a suggestion is made without an user' do
      it 'creates a new book suggestion' do
        make_suggestion
        byebug
        expect(BookSuggestion.count).to eq 1
      end

      it 'responds with 201 status' do
        make_suggestion
        expect(response).to have_http_status(:created)
      end
    end

    # context 'when an user makes a suggestion' do
    #   include_context 'when logged in'
    # 
    #   let(:new_suggestion_attributes) { attributes_for(:book_suggestion, user: user) }
    # 
    #   it 'creates a new book suggestion' do
    #     post api_v1_book_suggestions_path, params: { book_suggestion: new_suggestion_attributes }
    #     expect(BookSuggestion.count).to eq 1
    #   end
    # 
    #   it 'responds with 201 status' do
    #     post api_v1_book_suggestions_path, params: { book_suggestion: new_suggestion_attributes }
    #     expect(response).to have_http_status(:created)
    #   end
    # end
  end
end
