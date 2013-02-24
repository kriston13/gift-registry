class RegistryItem < ActiveRecord::Base
  attr_accessible :name, :description
  
  belongs_to :registry
  
  validates_presence_of :name
  
end
