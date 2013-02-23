class User < ActiveRecord::Base
  has_secure_password
  
  has_many :registries, :foreign_key => 'owner_id'
  
  attr_accessible :email, :firstname, :lastname, :password, :password_confirmation
  
  validates_uniqueness_of :email
  validates_presence_of :firstname
  
end
