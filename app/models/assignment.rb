class Assignment < ActiveRecord::Base
  attr_accessible :due_date, :grade, :start_date
  has_many :student_assignments
  belongs_to :course
end
