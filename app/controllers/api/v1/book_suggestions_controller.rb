module Api
  module V1
    class BookSuggestionsController < DeviseTokenAuthController
      # All API controllers are paginated
      include Wor::Paginate

      def index
        render_paginated BookSuggestion
      end

      def show
        suggestion = BookSuggestion.find(params[:id])
        respond_to do |format|
          format.json { render json: suggestion }
        end
      end

      def create
        suggestion = BookSuggestion.create(book_suggestion_params)
        respond_to do |format|
          format.json { render json: suggestion }
        end
      end

      def book_suggestion_params
        params.require(:book_suggestion).permit(
          :author,
          :title,
          :link,
          :publisher,
          :year,
          :editorial,
          :price
        )
      end
    end
  end
end
