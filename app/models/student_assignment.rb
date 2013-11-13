class StudentAssignment < ActiveRecord::Base
  attr_accessible :assignment_id, :student_id, :grade, :pod_id
  belongs_to :student
  belongs_to :assignment
  belongs_to :pod
end
