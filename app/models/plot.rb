class Plot < ActiveRecord::Base
  serialize :data
  attr_accessible :data, :plot_name
  has_many :graph_plots
  has_many :graphs, through: :graph_plots
end
