class Graph < ActiveRecord::Base
  attr_accessible :course_id
  belongs_to :course
  has_many :graphs
end
