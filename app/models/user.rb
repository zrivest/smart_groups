require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password

  has_many :courses

  include BCrypt

  has_secure_password

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate_login(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil
  end

  def self.authenticate_create(email, password)
    user = User.find_by_email(email)
    return false if user
    self.create(email: email, password: password, email: email)
  end
end
