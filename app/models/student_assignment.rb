class StudentAssignment < ActiveRecord::Base
  attr_accessible :assignment_id, :student_id,
                  :grade, :pod_id, :liked_pod,
                  :learned_in_pod, :submit_date,
                  :participation

  belongs_to :student
  belongs_to :assignment
  belongs_to :pod
end
