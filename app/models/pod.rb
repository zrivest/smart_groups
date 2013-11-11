class Pod < ActiveRecord::Base
  attr_accessible :group_id

  belongs_to :group
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :student_assignments, through: :students
end