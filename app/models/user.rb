class User < ActiveRecord::Base
  attr_accessible :email, :enabled, :failures, :firstname, :lastlogin, :lastname, :password, :salt
end
