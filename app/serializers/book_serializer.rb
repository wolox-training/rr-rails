class BookSerializer < ActiveModel::Serializer
  attributes :author, :title, :link, :publisher, :year, :editorial
end
