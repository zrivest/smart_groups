class Student < ActiveRecord::Base
  attr_accessible :average, :first_name, :last_name
  has_many :enrollments
  has_many :student_assignments
  has_many :assignments, through: :student_assignments
  has_many :courses, through: :enrollments
end
