module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book
      end

      def show
        book = Book.find(params[:id])
        respond_to do |format|
          format.json { render json: book }
        end
      end
    end
  end
end
