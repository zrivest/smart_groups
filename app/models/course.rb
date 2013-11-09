class Course < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :assignments
  belongs_to :user
  has_many :enrollments
end
