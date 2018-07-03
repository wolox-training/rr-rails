FactoryBot.define do
  factory :book do
    genre  { Faker::Book.genre }
    author { Faker::Book.author }
    title  { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1440, Date.current.year).to_s }
    image { Faker::Avatar.image }
  end
end
