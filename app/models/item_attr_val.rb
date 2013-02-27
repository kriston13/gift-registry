class ItemAttrVal < ActiveRecord::Base
  belongs_to :attr_name
  belongs_to :registry_item
  
  attr_accessible :registry_item_id, :attr_name_id, :raw_value
  
  validates_presence_of :raw_value
  
  before_save :assign_value
  
  
  def remove_dollar_sign
    if self.raw_value.start_with?("$")
      self.raw_value = self.raw_value[1,self.raw_value.length-1]
    end
  end
  
  def assign_value
    if attr_type = AttrName.find_by_id(self.attr_name_id).value_type
      case attr_type
      when "STRING"
        self.string_val = self.raw_value
      when "FLOAT"
        remove_dollar_sign
        self.float_val = self.raw_value.to_f
      when "DATETIME"
        self.datetime_val = self.raw_value.to_datetime
      when "BOOLEAN"
        if self.raw_value == 'true'
          self.bool_val = true
        else
          self.bool_val = false
        end
      when "INTEGER"
        self.int_val = self.raw_value.to_i
      else
        self.string_val = self.raw_value
      end
    end
  end
  
end
