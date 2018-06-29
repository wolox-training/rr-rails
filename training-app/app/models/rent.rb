class Rent < ApplicationRecord
  validates :from, presence: true
  validates :to, presence: true

  belongs_to :user
  belongs_to :book
end
