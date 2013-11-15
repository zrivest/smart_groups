class Group < ActiveRecord::Base
  attr_accessible :course_id
  attr_accessor :total_students_per_groups,
                :total_num_of_groups, :random,
                :even_grade_distribution

  has_many :pods
  has_many :enrollments, through: :pods
  has_many :students, through: :enrollments
  has_many :student_assignments, through: :students
  has_many :assignments, through: :student_assignments
  belongs_to :course
  
  def self.create_groups_by_number_of_students(students, group_requirements)
    students_per_group = group_requirements[:total_students_per_groups].to_i

    if group_requirements[:even_grade_distribution].to_i == 1
      groups = self.total_students_even_groups(students_per_group, students)
    elsif group_requirements[:random].to_i == 1
      groups = self.total_students_groups(students_per_group, students)
    end
  end

  def self.create_groups_by_number_of_groups(students, group_requirements)
    students_per_group = group_requirements[:total_num_per_groups].to_i
    if group_requirements[:even_grade_distribution].to_i == 1
      groups = self.total_num_even_groups(students_per_group, students)
    elsif group_requirements[:random].to_i == 1
      groups = self.total_num_groups(students_per_group, students)
    end
  end

  def self.random(students)
    students.shuffle!
  end

  def self.average(students)
    students.each do |student|
      assignments = self.list_specific_attribute(student, :grade)
      student.update_average(assignments)
    end
     students.sort_by!(&:average)
  end

  def self.list_specific_attribute(student, attribute)
    assignments = []
    StudentAssignment.where(student_id: student.id).each do |assignment|
      assignments << assignment.send(attribute)
    end
    assignments
  end

  def self.total_num_groups(num_groups, students)
    self.random(students)
    num_students = students.length
    students_per_group = num_students/num_groups
    Array.new(num_groups) {students.shift(students_per_group)}
  end

  def self.total_num_even_groups(num_groups, students)
    self.average(students)
    num_students = students.length

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


  def self.total_students_groups(students_per_group, students)
    self.random(students)
    num_students = students.length
    num_groups = num_students/students_per_group

    groups = Array.new(num_groups) {students.shift(students_per_group)}
    groups
  end

  def self.total_students_even_groups(students_per_group, students)
    self.average(students)
    num_students = students.length
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
