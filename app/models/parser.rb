class Parser < ActiveRecord::Base
  require 'smarter_csv'

  def self.import(file, course)
    SmarterCSV.process(file.path, :headers => true, :header_converters => :symbol).each do |row|
      a = Assignment.create!( start_date: row[:start_date],
                          due_date: row[:due_date],
                          assignment_name: row[:assignment_name] )

      s = Student.create!( first_name: row[:first_name],
                       last_name: row[:last_name] )

      sa = StudentAssignment.create!( grade: row[:grade] )

      s.assignments << a
      course.students << s
    end
  end
end