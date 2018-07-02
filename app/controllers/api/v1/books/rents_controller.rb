module Api
  module V1
    module Books
      class RentsController < ApplicationController
        before_action :authenticate_user!

        include Wor::Paginate

        def index
          render_paginated Rent.where(book_id: params[:book_id])
        end
      end
    end
  end
end
