class Assignment < ActiveRecord::Base
  attr_accessible :due_date, :grade, :start_date, :assignment_name

  has_many :student_assignments
  has_many :students, through: :student_assignments
  has_many :enrollments, through: :students
  has_many :groups, through: :enrollments

  belongs_to :course

end
