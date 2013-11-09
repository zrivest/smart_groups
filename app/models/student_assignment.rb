class StudentAssignment < ActiveRecord::Base
  attr_accessible :assignment_id, :student_id, :grade
  belongs_to :student
  belongs_to :assignment
end
