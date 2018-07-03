module Api
  module V1
    class ApiController < DeviseTokenAuthController
      # All API controllers require to have the user authenticated
      before_action :authenticate_user!
      # We set the current locale for our user
      before_action :set_user_locale
      # All API controllers are paginated
      include Wor::Paginate
      # Raise a common not found exception when a model wasn't found
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      # Raise a common not created exception when a model is invalid
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

      protected

      def record_not_found(exception)
        render json: { error: exception.message }, status: :not_found
      end

      def record_invalid(exception)
        render json: { errors: exception.errors }, status: :not_created
      end

      def set_user_locale
        I18n.locale = current_user.locale.to_sym || I18n.default_locale
      end
    end
  end
end
