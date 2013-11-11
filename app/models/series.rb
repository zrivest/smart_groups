class Series < ActiveRecord::Base
  attr_accessible :data
  has_many :graphs
end
