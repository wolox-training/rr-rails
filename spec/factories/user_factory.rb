FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password '123123123'
    password_confirmation '123123123'
    confirmed_at { Time.now }
  end
end
