class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
  attr_accessor :random, :even_grade_distribution

  belongs_to :user
  has_many :assignments
  has_many :enrollments
  has_many :students, through: :enrollments
  has_many :groups

  
end  
