class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
<<<<<<< HEAD
  attr_accessor :num_of_groups, :num_per_group
  belongs_to :user
  has_many :students

  def self.random(students)
    students.shuffle!
  end

  def self.total_students_groups(num_students, students_per_group, students)
    num_groups = num_students/students_per_group
    groups = Array.new(num_groups) {students.shift(students_per_group)}
    groups
  end

  def self.total_num_groups(num_students, num_groups, students)
    p "______________________________________"
    p "I am here"
    students_per_group = num_students/num_groups
    groups = Array.new(num_groups) {students.shift(students_per_group)}
    groups
  end





=======
  has_many :assignments
  belongs_to :user
  has_many :enrollments
>>>>>>> e28e1340b3e0770d622ed347113dad8b687eb248
end

