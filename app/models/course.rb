class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :graphs
  has_many :assignments
  has_many :groups
  has_many :pods, through: :groups
  has_many :enrollments
  has_many :students, through: :enrollments
  belongs_to :user

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

  def self.average(students)
    students.each do |student|
      assignments = []
      StudentAssignment.where(student_id: student.id).each do |assignment|
        assignments << assignment.grade
      end
      sum = 0
      assignments.each{|n| sum += n}
      average = sum/(assignments.length)
      student.update_attributes!(average: average)
    end
    students = students.sort_by!(&:average)

  end

  def self.total_num_groups(num_students, num_groups, students)
    students_per_group = num_students/num_groups
    Array.new(num_groups) {students.shift(students_per_group)}
  end

  def self.total_num_even_groups(num_students, num_groups, students)
    counter = 0
    students_per_group = num_students/num_groups
    sections = Array.new(students_per_group) {students.shift(num_groups)}
    num_of_groups = sections.length
    num_of_students = sections[0].length
    groups = Array.new(num_of_students) {Array.new(num_of_groups)}

    num_of_students.times do |j|
      num_of_groups.times do |i|
        if counter.even?
          groups[j][i] = sections[i].shift
        else
          groups[j][i] = sections[i].pop
        end
        counter += 1
      end
    end
    groups
  end


  def self.total_students_groups(num_students, students_per_group, students)
    num_groups = num_students/students_per_group
    groups = Array.new(num_groups) {students.shift(students_per_group)}
    groups
  end

  def self.total_students_even_groups(num_students, students_per_group, students)
    counter = 0
    num_groups = num_students/students_per_group
    sections = Array.new(students_per_group) {students.shift(num_groups)}
    num_of_groups = sections.length
    num_of_students = sections[0].length
    groups = Array.new(num_of_students) {Array.new(num_of_groups)}

    num_of_students.times do |j|
      num_of_groups.times do |i|
        if counter.even?
          groups[j][i] = sections[i].shift
        else
          groups[j][i] = sections[i].pop
        end
        counter += 1
      end
    end
    groups
  end

end

