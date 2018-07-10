class BookSuggestion < ApplicationRecord
  validates :author, presence: true
  validates :title, presence: true
  validates :link, presence: true
  # Next card specifies than a suggestion can be made without a book
  belongs_to :user, optional: true
end
