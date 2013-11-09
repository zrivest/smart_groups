class Parser < ActiveRecord::Base
  require 'smarter_csv'

  def self.import(file)
    SmarterCSV.process(file.path, :headers => true, :header_converters => :symbol).each do |row|
      Assignment.create!( start_date: row[:start_date],
                          due_date: row[:due_date],
                          assignment_name: row[:assignment_name] )

      Student.create!( first_name: row[:first_name],
                       last_name: row[:last_name] )

      StudentAssignment.create!( grade: row[:grade] )
    end
  end
end