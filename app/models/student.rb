class Student < ActiveRecord::Base
  attr_accessible :course_id, :first_name, :last_name
  belongs_to :course
  has_many :student_assignments
  has_many :assignments, through: :student_assignments
end
