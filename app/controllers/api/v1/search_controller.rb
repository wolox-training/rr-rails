module Api
  module V1
    class SearchController < ApplicationController
      def index
        result = OpenLibraryService.new.book_info search_params['isbn']
        respond_to do |format|
          if result
            format.json { render json: result }
          else
            format.json do
              render status: 404, json: { ok: false, error: 'No book was found with that ISBN.' }
            end
          end
        end
      end

      def search_params
        params.require(:query).permit(:isbn)
      end
    end
  end
end
