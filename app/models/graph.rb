class Graph < ActiveRecord::Base
  serialize :categories
  attr_accessible :course_id, :categories
  belongs_to :course
  has_many :graph_plots
  has_many :plots, through: :graph_plots
end
