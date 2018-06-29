# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :author, :genre, :image, :title, :publisher, :year
end
