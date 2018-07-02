class RentSerializer < ActiveModel::Serializer
  attributes :from, :to
  belongs_to :book
  belongs_to :user
end
