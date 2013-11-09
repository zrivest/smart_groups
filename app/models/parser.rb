class Parser < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :grade, :start_date, :due_date


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Assignment.create! row.to_has
    end
  end
ende