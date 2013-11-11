class GraphPlot < ActiveRecord::Base
  attr_accessible :graph_id, :plot_id
  belongs_to :graph
  belongs_to :plot
end
