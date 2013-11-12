class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
  attr_accessor :random, :even_grade_distribution

  belongs_to :user
  has_many :assignments
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :groups
  has_many :pods, through: :groups
  # has_many :students, through: :pods

  def all_students
    students = self.enrollments.map do |enrollment|
      enrollment.student
    end
    students
  end

  def all_completed_assignments_for_course
    completed_assignments = []
    self.assignments.each do |assignment|
      assignment.student_assignments.each do |student_assignment|
        completed_assignments << student_assignment
      end
    end
    completed_assignments
  end

  def unique_students
    students = self.all_students.uniq{ |student| student.id }
  end

end  
