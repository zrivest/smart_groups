FactoryGirl.define do
  factory :assignment do
    assignment_name {Faker::Company.bs}
    start_date "11/11/2013"
    due_date "11/12/2013"
    course_id 1
  end
end