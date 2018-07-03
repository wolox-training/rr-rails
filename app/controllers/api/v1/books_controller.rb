module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book
      end

      def show
        # Not a strong parameter, because :id is part of the API URL
        @book = Book.find(params[:id])
        render json: @book
      end
    end
  end
end
