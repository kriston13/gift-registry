class ItemAttrVal < ActiveRecord::Base
  belongs_to :attr_name
  belongs_to :registry_item
  
  attr_accessible :registry_item_id, :attr_name_id, :raw_value
  
  validates_presence_of :raw_value
  
  before_save :assign_value
  
  
  #currently only works with dollar sign.
  #might actually be unnecessary.
  def remove_dollar_sign
    if self.raw_value.start_with?("$")
      self.raw_value = self.raw_value[1,self.raw_value.length-1]
    end
  end
  
  # gets the attribute's type, and then determines which of the columns to populate it with.
  # the raw value is still stored for prosperity's sake
  def assign_value
    if attr_type = AttrName.find_by_id(self.attr_name_id).value_type
      case attr_type
      when "STRING"
        self.string_val = self.raw_value
      when "FLOAT"  #has a special case to remove the dollar symbol in front of it
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
