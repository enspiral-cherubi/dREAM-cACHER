FactoryGirl.define do
  factory :dream do
    contents { Faker::Lorem.paragraph }
    user
  end

end
