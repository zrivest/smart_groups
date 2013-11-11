class Series < ActiveRecord::Base
  attr_accessible :data
  has_many :graph_serieses
  has_many :graphs, through: :graph_serieses
end
