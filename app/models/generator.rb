class Generator < ActiveRecord::Base
  attr_accessible :num_of_groups, :num_per_group
  belongs_to :course
end
