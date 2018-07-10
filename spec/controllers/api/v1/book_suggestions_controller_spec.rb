require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #index', type: :request do
    subject :suggestion do
      post api_v1_book_suggestions_path, params: { book_suggestion: new_suggestion_attributes }
      response
    end

    let(:new_suggestion_attributes) { attributes_for(:book_suggestion) }

    context 'when a suggestion is made without an user' do
      it 'creates a new book suggestion' do
        suggestion
        expect(BookSuggestion.count).to eq 1
      end

      it 'responds with 201 status' do
        expect(suggestion).to have_http_status(:created)
      end
    end

    context 'when an user makes a suggestion' do
      include_context 'when logged in'

      it 'creates a new book suggestion' do
        suggestion
        expect(BookSuggestion.count).to eq 1
      end

      it 'responds with 201 status' do
        expect(suggestion).to have_http_status(:created)
      end
    end

    context 'when an invalid response is created' do
      let(:new_suggestion_attributes) { attributes_for(:book_suggestion, title: nil) }

      it 'doesn\'t create a new book suggestion' do
        suggestion
        expect(BookSuggestion.count).to eq 0
      end

      it 'responds with 422 status' do
        expect(suggestion).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
