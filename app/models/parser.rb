class Parser < ActiveRecord::Base
  require 'smarter_csv'

  def self.import(file, course, user)
    SmarterCSV.process(file.path, :headers => true, :header_converters => :symbol).each do |row|
      a = Assignment.create!( start_date: row[:start_date],
                          due_date: row[:due_date],
                          assignment_name: row[:assignment_name] )
      a.save!
      s = Student.where(first_name: row[:first_name]).first_or_create(last_name: row[:last_name])
      s.save!

      sa = StudentAssignment.create!(student_id: s.id, assignment_id: a.id, grade: row[:grade] )
      sa.save!
      # s.assignments << a
      course.students << s
    end
      user.courses << course
  end
end