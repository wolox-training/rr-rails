class BookSerializer < ActiveModel::Serializer
  attributes :author, :genre, :image, :title, :publisher, :year
end
