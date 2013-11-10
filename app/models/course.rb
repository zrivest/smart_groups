class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
<<<<<<< HEAD
  has_many :assignments
  belongs_to :user
  has_many :enrollments
  has_many :students, through: :enrollments

  attr_accessor :num_of_groups, :num_per_group
=======
  attr_accessor :num_of_groups, :num_per_group, :random, :even_grade_distribution
>>>>>>> master
  belongs_to :user
  has_many :assignments
  has_many :enrollments
  has_many :students, through: :enrollments

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
<<<<<<< HEAD

end
=======
end  
>>>>>>> master

