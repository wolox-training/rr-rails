module Api
  module V1
    class BookSuggestionsController < DeviseTokenAuthController
      def create
        suggestion = BookSuggestion.new(book_suggestion_params)
        respond_to do |format|
          if suggestion.save
            format.json { render status: 201, json: suggestion }
          else
            format.json do
              render status: 400, json: { ok: false, errors: suggestion.errors.full_messages }
            end
          end
        end
      end

      def book_suggestion_params
        result = params.require(:book_suggestion).permit(
          :author,
          :title,
          :link,
          :publisher,
          :year,
          :editorial,
          :price
        )
        current_user ? result.merge(user_id: current_user.id) : result
      end
    end
  end
end
