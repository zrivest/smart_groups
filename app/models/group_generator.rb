class GroupGenerator
  extend ActiveModel::Callbacks
  include ActiveModel::Validations

  define_model_callbacks :generate

  attr_accessor :course_id, :random, :even_grade_distribution, 
                :total_students_per_groups, :total_num_of_groups

  attr_accessor :ungrouped_students, :group, :pods, :grouped_students

  before_generate :valid?

  validate :distribution_method_provided
  validate :only_one_distribution_method_provided

  def initialize(course_id, attributes = {})
    self.course_id = course_id
    self.grouped_students = []

    attributes.each do |attr, value|
      self.send("#{attr}=", value)
    end
  end

  def distribute(students)
    self.ungrouped_students = students

    if !total_students_per_groups.blank?
      if random_checked?
        group_students_by_random_by_student_num
      elsif even_grade_checked?
        group_students_by_even_grade_by_student_num
      else
        raise "Invalid distrubtion method provided"
      end
    elsif !total_num_of_groups.blank?
      if random_checked?
        group_students_by_random_by_group_num
      elsif even_grade_checked?
        group_students_by_even_grade_by_group_num
      else
        raise "Invalid distrubtion method provided"
      end
    end
  end

  def updated_students_averages
    ungrouped_students.each do |student|
      assignments = list_specific_attribute(student, :grade)
      student.update_average(assignments)
    end
      ungrouped_students.sort_by!(&:average)
  end

#1 --- create groups by num of groups
  # ---- total num groups
  def group_students_by_random_by_student_num
    ungrouped_students.shuffle!
    num_students = ungrouped_students.length
    num_groups = num_students/total_students_per_groups.to_i
    1.upto(num_groups) do
      pod = []
      1.upto(total_students_per_groups.to_i) do
        pod << ungrouped_students.shift
      end
      grouped_students << pod
    end
    grouped_students
  end




  def generate
    run_callbacks :generate do
      self.group = Group.new(course_id: course_id)

      grouped_students.each do |students|
        pod = group.pods.create

        students.each do |student|
          StudentAssignment.find(student.id).update_attributes!(pod_id: pod.id)
        end

        pods << pod
      end
    end
  end

  def distribution_method_provided
    if !random_checked? && !even_grade_checked?
      errors.add(:base, "At least one distrubution method (random, even grade) must be chosen")
    end
  end

  def only_one_distribution_method_provided
    if random_checked? && even_grade_checked?
      errors.add(:base, "Only one distrubution method (random, even grade) must be chosen")
    end
  end

  def random_checked?
    !random.blank? && random == "1"
  end

  def even_grade_checked?
    !even_grade_distribution.blank? && even_grade_distribution == "1"
  end
end


  # def list_specific_attribute(student, attribute)
  #   assignments = []
  #   StudentAssignment.where(student_id: student.id).each do |assignment|
  #     assignments << assignment.send(attribute)
  #   end
  #   assignments
  # end
###### 2 ###### ->
# ------ total num even groups
  # def group_students_by_even_grade_by_student_num
  #   update_students_averages
  #   num_students = ungrouped_students.length
  #   num_groups = num_students/total_students_per_groups.to_i
  #   counter = 0
  #   sections = Array.new(students_per_group) {students.shift(num_groups)}
  #     num_of_groups = sections.length
  #     num_of_students = sections[0].length
  #     groups = Array.new(num_of_students) {Array.new(num_of_groups)}

  #     num_of_students.times do |j|
  #       num_of_groups.times do |i|
  #         if counter.even?
  #           groups[j][i] = sections[i].shift
  #         else
  #           groups[j][i] = sections[i].pop
  #         end
  #         counter += 1
  #       end
  #     end
  #   groups

  #   1.upto(num_groups) do
  #     pod = []


  #     #fill this in with the algorithm for averages above sorta
  #     # 1.upto(total_students_per_groups) do
  #     #   pod << ungrouped_students.shift
  #     # end
  #     grouped_students << pod
  #   end

  # end
  
####### 2 ###### <-



# ###### 3 ##### ->
#   def group_students_by_random_by_group_num
#     ungrouped_students.shuffle!
#     num_groups = ungrouped_students.length
#     num_students = num_groups/total_students_per_groups.to_i

#     1.upto(num_students) do
#       pod = []
#       1.upto(total_students_per_groups) do
#         pod << ungrouped_students.shift
#       end

#       grouped_students << pod
#     end
#   end
# ###### 3 ###### <-








