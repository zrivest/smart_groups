class Enrollment < ActiveRecord::Base
  attr_accessible :course_id, :student_id, :pod_id

  belongs_to :course
  belongs_to :student
end
