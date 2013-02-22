class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :firstname, :lastname, :password, :password_confirmation
  
  validates_uniqueness_of :email
  validates_presence_of :firstname
  
end
