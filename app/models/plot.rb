class Plot < ActiveRecord::Base
  attr_accessible :data
  has_many :graph_plots
  has_many :graphs, through: :graph_plots
end
