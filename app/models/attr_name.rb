class AttrName < ActiveRecord::Base
  has_many :item_attr_vals
  has_many :registry_items, :through => :item_attr_vals
  
  attr_accessible :description, :link, :value_type, :treat_as_price
  
  validates_uniqueness_of :description
  

end
