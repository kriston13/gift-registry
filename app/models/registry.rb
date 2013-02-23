class Registry < ActiveRecord::Base
  
  #belongs_to :owner, :class_name =>"User", :foreign_key => "owner_id"
  #has_many :subscriptions
  #belongs_to :user, :foreign_key => "owner_id"
  belongs_to :owner, :class_name => "User"
  
  attr_accessible :name, :description, :startdate, :enddate, :public, :interest_interval, :max_interest, :owner_id
  
  
end
