module Api
  module V1
    class SearchController < ApiController
      def index
        service = OpenLibraryService.new
        result = service.book_info search_params['isbn']
        respond_to do |format|
          format.json { render json: result }
        end
      end

      def search_params
        params.require(:search).permit(:isbn)
      end
    end
  end
end
