class RegistryItem < ActiveRecord::Base
  belongs_to :registry
  has_many :item_attr_vals
  has_many :attr_names, :through => :item_attr_vals
  
  attr_accessible :name, :description
  
  
  validates_presence_of :name
  
end
