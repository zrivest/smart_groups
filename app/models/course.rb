class Course < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :assignments
  belongs_to :user
  has_many :enrollments
  has_many :students, through: :enrollments

  attr_accessor :num_of_groups, :num_per_group, :random, :even_grade_distribution

  def self.random(students)
    students.shuffle!
  end

  def get_student_full_names
    @full_names = self.students.map {|student| "#{student.last_name}" + "#{student.last_name}"}
    return @full_names
  end

  def get_student_full_names
    @full_names = self.students.map {|student| "#{student.last_name}" + "#{student.last_name}"}
    return @full_names
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
end


