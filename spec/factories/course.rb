FactoryGirl.define do
  factory :course do
    user_id 1
    name ["English", "Math"].sample
  end
end