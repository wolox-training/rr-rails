module Api
  module V1
    module Books
      class RentsController < ApiController
        def index
          results = Rent.includes(:user, :book).where(book_id: params[:book_id])
          render_paginated results
        end
      end
    end
  end
end
