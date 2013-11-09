class Student < ActiveRecord::Base
  attr_accessible :course_id, :first_name, :last_name
  has_many :enrollments
  has_many :student_assignments
  has_many :assignments, through: :students
end
