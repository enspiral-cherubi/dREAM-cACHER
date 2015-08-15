FactoryGirl.define do
  factory :user do
    user_name Faker::Internet.user_name
    sequence(:email) { |n| "freddy#{n}@example.com" }
    password 'asdfqwer'
  end



end
