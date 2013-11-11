class GraphSeries < ActiveRecord::Base
  attr_accessible :graph_id, :series_id
  belongs_to :graph
  belongs_to :series
end
