FactoryGirl.define do
  factory :dream do
    contents Faker::Lorem.paragraph
    sentiment 0.5
    user
  end

end
