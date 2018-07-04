FactoryBot.define do
  factory :book_suggestion do
    author { Faker::Book.author }
    title  { Faker::Book.title }
    link   { Faker::Internet.url }
    user   { create :user }
  end
end
