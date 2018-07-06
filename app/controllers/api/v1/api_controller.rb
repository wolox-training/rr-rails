module Api
  module V1
    class ApiController < ApplicationController
      # All API controllers require to have the user authenticated
      before_action :authenticate_user!
      # All API controllers are paginated
      include Wor::Paginate
      # Raise a common not found exception when a model wasn't found
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      def record_not_found(exception)
        render json: { error: exception.message }, status: :not_found
      end
    end
  end
end
