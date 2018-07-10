module Api
  module V1
    class BookSuggestionsController < DeviseTokenAuthController
      rescue_from ActiveRecord::RecordInvalid, with: :on_invalid_record
      rescue_from ActionController::ParameterMissing, with: :on_invalid_record

      def create
        suggestion = BookSuggestion.create! book_suggestion_params
        respond_to do |format|
          format.json { render status: :created, json: suggestion }
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

      def on_invalid_record(exception)
        render status: :unprocessable_entity, json: { ok: false, error: exception.message }
      end
    end
  end
end
