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

  def self.random(students)
    students.shuffle!
  end

  def self.average(students)
    students.each do |student|
      assignments = []
      StudentAssignment.where(student_id: student.id).each do |assignment|
        0 if assignment.grade == nil
        assignments << assignment.grade
      end
      sum = 0
      
      if assignments.length > 0
        assignments.each{|n| sum += n}
        average = sum/(assignments.length)
        student.update_attributes!(average: average)
      else 
        return 0
      end
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
      if sections.length > 0
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
      else
        return 0
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
