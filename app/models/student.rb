class Student < ActiveRecord::Base
  attr_accessible :average, :first_name, :last_name, :group_rating
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :student_assignments
  has_many :assignments, through: :student_assignments



  def get_grades
    self.student_assignments.map {|submitted_assignment| submitted_assignment.grade}
  end

  def name
    "#{self.first_name}" + " #{self.last_name}"
  end

  def average_grade_by_student_assignment(student_assignment)
    grades = []
    studentassignment = StudentAssignment.find(student_assignment.id)
    self.student_assignment
  end

  def completed_assignments_for(course)
    self.student_assignments.where(course_id: course.id)
  end

  def average_grade
    grades = self.get_grades
    average = grades.inject{ |sum, grade| sum + grade }.to_f / grades.length
  end

end
