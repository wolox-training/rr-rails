module Api
  module V1
    module Users
      class RentsController < ApiController
        def index
          render_paginated Rent.where(user_id: params[:user_id])
        end

        def create
          rent = Rent.create(rent_params)
          NotificationsMailer.new_rent_email(rent).deliver_later
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
