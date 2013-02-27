class AttrName < ActiveRecord::Base
  has_many :item_attr_vals
  has_many :registry_items, :through => :item_attr_vals
  
  attr_accessible :description, :link, :value_type
  
  validates_uniqueness_of :description
  
  #validate :must_be_a_valid_type
  
  #@type_list = [ "STRING", "FLOAT", "BOOLEAN", "DATETIME", "INTEGER"]
  
  
  # def must_be_a_valid_type
  #     if @type_list.includes?(self.value_type)
  #       true
  #     else
  #       false
  #       errors.add(:value_type, "Please select one of the following types: #{type_list.tosentence(:last_word_connector => ', or')}")
  #     end
  #   end
  #   
  
end
