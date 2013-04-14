class RegistryItem < ActiveRecord::Base
  belongs_to :registry, :include => :item_attr_vals
  has_many :item_attr_vals
  has_many :attr_names, :through => :item_attr_vals
  
  has_many :bookings
  
  attr_accessible :name, :description, :item_attr_vals_attributes
  accepts_nested_attributes_for :item_attr_vals, :allow_destroy => :true
  
  
  validates_presence_of :name
  

  
end
