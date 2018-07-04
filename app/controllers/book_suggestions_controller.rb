class BookSuggestionsController < DeviseTokenAuthController
  def new
    @suggestion = BookSuggestion.new
  end
end
