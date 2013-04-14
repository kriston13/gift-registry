class User < ActiveRecord::Base
  has_secure_password
  
  has_many :registries, :foreign_key => 'owner_id'
  has_many :bookings
  
  attr_accessible :email, :firstname, :lastname, :password, :password_confirmation
  
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :firstname
  
end
