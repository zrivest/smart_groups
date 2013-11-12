class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
  attr_accessor :random, :even_grade_distribution

  belongs_to :user
  has_many :graphs
  has_many :assignments
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :groups
  has_many :pods, through: :groups
  has_many :students, through: :pods

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

  def grade_and_due_date_hash
    @grades_hash = {}
    self.assignments.each do |assignment|
      assignment.student_assignments.each do |student_assignment|
        @grades_hash[:grade] = student_assignment.student.get_grades
        @grades_hash[:due_date] = student_assignment.assignment.due_date
      end
    end
    @grades_hash
  end

  def grade_series
       @grades = []
    self.assignments.each do |assignment|
      assignment.student_assignments.each do |student_assignment|
        @grades << student_assignment.student.get_grades.flatten
      end
    end
    @grades
  end

  def due_date_series
    @due_dates = []
    self.assignments.each do |assignment|
      assignment.student_assignments.each do |student_assignment|
        @due_dates << student_assignment.assignment.due_date
      end
    end
    @due_dates
  end
end
