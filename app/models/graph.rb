class Graph < ActiveRecord::Base
  attr_accessible :course_id
  belongs_to :course
  has_many :graph_plots
  has_many :plots, through: :graph_plots
end
