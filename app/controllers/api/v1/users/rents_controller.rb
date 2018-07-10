module Api
  module V1
    module Users
      class RentsController < ApiController
        def index
          render_paginated policy_scope(Rent).where(user_id: params[:user_id])
        end

        def create
          rent = authorize Rent.create(rent_params)
          RentNotificationsJob.perform_later(rent)
          respond_to do |format|
            format.json { render json: rent }
          end
        end

        def rent_params
          params.require(:rent).permit(:from, :to, :book_id, :user_id)
        end
      end
    end
  end
end
