class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
  attr_accessor :num_of_groups, :num_per_group, :random, :even_grade_distribution

  belongs_to :user
  has_many :assignments
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :groups
  has_many :pods, through: :groups
  has_many :students, through: :pods

  def self.random(students)
    students.shuffle!
  end

  def self.total_students_groups(num_students, students_per_group, students)
    num_groups = num_students/students_per_group
    groups = Array.new(num_groups) {students.shift(students_per_group)}
    groups
  end

  def self.total_num_groups(num_students, num_groups, students)
    students_per_group = num_students/num_groups
    groups = Array.new(num_groups) {students.shift(students_per_group)}
    groups
  end

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
end

