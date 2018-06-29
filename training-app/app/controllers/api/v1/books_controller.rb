module Api
  module V1
    class BooksController < ApplicationController
      before_action :authenticate_user!

      include Wor::Paginate

      def index
        render_paginated Book
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end
    end
  end
end
