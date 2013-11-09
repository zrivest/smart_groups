class Assignment < ActiveRecord::Base
  attr_accessible :due_date, :grade, :start_date, :assignment_name

  has_many :student_assignments
  has_one :student, through: :student_assignments

  belongs_to :course

end
