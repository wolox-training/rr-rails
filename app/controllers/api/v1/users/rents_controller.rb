module Api
  module V1
    module Users
      class RentsController < ApiController
        def index
          results = Rent.includes(:user, :book).where(user_id: params[:user_id])
          render_paginated results
        end

        def create
          rent = Rent.create(rent_params)
          RentNotificationsJob.perform_later(rent.id)
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
