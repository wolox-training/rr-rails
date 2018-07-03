module Api
  module V1
    module Books
      class RentsController < ApiController
        def index
          render_paginated Rent.where(book_id: params[:book_id])
        end
      end
    end
  end
end
