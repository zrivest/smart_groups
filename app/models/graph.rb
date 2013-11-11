class Graph < ActiveRecord::Base
  attr_accessible :course_id
  belongs_to :course
  has_many :graph_serieses
  has_many :graphs, through: :graph_serieses
end
