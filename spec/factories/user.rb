FactoryGirl.define do
  factory :user do
    id 1
    email { Faker::Internet.email }
    password "password"
  end
end