class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :author, :title, :link, :publisher, :year, :editorial, :price
end
