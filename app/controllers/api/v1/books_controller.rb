module Api
  module V1
    class BooksController < ApiController
      def index
        render_paginated Book
      end

      def show
        # Not a strong parameter, because :id is part of the API URL
        respond_to do |format|
          if Book.exists? params[:id]
            format.json { render json: Book.find(params[:id]) }
          else
            format.json do
              render status: 404, json: { error: "No book was found with id #{params[:id]}." }
            end
          end
        end
      end
    end
  end
end
