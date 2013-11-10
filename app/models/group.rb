class Group < ActiveRecord::Base
  attr_accessible :course_id

  has_many :pods
  has_many :enrollments, through: :pods
  has_many :students, through: :enrollments
  has_many :student_assignments, through: :students
  has_many :assignments, through: :student_assignments
  belongs_to :course

end