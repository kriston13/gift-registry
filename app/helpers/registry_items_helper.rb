module RegistryItemsHelper

  def formatted_value(iav)
    @an = AttrName.find_by_id(iav.attr_name_id)
    case @an.value_type
    when "INTEGER"
      if @an.treat_as_price
        humanized_money_with_symbol iav.price_val
      else
        iav.int_val
      end
      #iav.int_val ? iav.int_val : iav.price_val
    when "BOOLEAN"
      iav.boolean_val
    when "DATETIME"
      iav.datetime_val
    when "FLOAT"
      iav.float_val
    else
      iav.string_val
    end
  end

end
