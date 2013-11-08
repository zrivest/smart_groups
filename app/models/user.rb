class User < ActiveRecord::Base
  attr_accessible :email, :password_digest

  has_many :courses
end
