class Student < ActiveRecord::Base
  attr_accessible :course_id, :first_name, :last_name
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :student_assignments
  has_many :assignments, through: :student_assignments



  def get_grades
    @grades = self.student_assignments.map {|submitted_assignment| submitted_assignment.grade}
    return @grades
  end

end
