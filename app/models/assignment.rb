class Assignment < ActiveRecord::Base
  attr_accessible :due_date, :grade, :start_date, :assignment_name, :course_id

  has_many :student_assignments
  has_many :students, through: :student_assignments
  has_many :enrollments, through: :students
  has_many :groups, through: :enrollments

  belongs_to :course


   def course_average
    grades = self.student_assignments.map(&:grade).compact
    grades.inject{ |sum, element| sum + element }.to_f / grades.length
  end

end
