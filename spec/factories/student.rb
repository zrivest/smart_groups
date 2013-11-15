FactoryGirl.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    average { rand(50-100) }
  end

  factory :avg_student_1 do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    average { rand(50-100) }
  end

  factory :avg_student_2 do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    average { rand(50-100) }
  end

end
