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

  # => given a list of assigned attribute values
  # => and reformats it in a manner appropriate for how we want to output it
  # => this is going to create an array that contains hashes of formatted attribute values
  # => hashes will be
  # =>  :attr_description
  # =>  :attr_value
  def format_attributes_for_listing(iav_list)
    
    formatted_list = Array.new {Hash.new} # => this will be used for actual printing
    used_attributes = Array.new           # => this is used for the loops to check whether it has been previously used or not.
    
    iav_list.each do |av|
      an_name = av.attr_name.description
      
      #logger.debug an_name+"\n"
      
      attr_description = String.new
      attr_value = String.new
      
    
      if an_name.starts_with?("Range")
        # => regex for something the pattern of "Range Low Price", and "Range High Length" is /\ARange\s(.+)\s(.+)/
        # => the regex should also probably be captured as a constant elsewhere
        attr_attrs = an_name.scan(/\ARange\s(\w+)\s(.+)/)[0]
        logger.debug "the attribute here is: #{attr_attrs[1]}\n"
        
        # logger.debug "about to start checking if this has previously been used or not"
        #         logger.debug "used_attributes are: #{used_attributes}"
        #         logger.debug "the attribute is #{attr_attrs[1]}"
        #         logger.debug "the next step should return: #{used_attributes.include?(attr_attrs[1])}\n\n\n\n"
        if used_attributes.include?(attr_attrs[1])
          #go to the next iteration if this one has already been added to the list
          next
        else
          #find its opposite, and then parse them to be added to the formatted_list
          # logger.debug "not already used, going to look for its opposite now \n\n"
          opp = String.new
          attr_attrs[0]=="Low" ? opp="High" : opp="Low"
          
          # logger.debug "the opposite is: #{opp} \n\n"
          #     
          #     logger.debug "i'm looking for: Range #{opp} #{attr_attrs[1]}"
          
          opp_id=AttrName.find_by_description("Range " + opp + " " + attr_attrs[1]).id
                    # 
                    # logger.debug "the opposite attribute id is: #{opp_id}"
                    # 
                    # logger.debug "my next piece of magic should be the value: #{iav_list.find_by_id(opp_id)}"
          if opp_av = iav_list.find_by_attr_name_id(opp_id)
            
            # logger.debug "found the opposite in the list"
            used_attributes.push(attr_attrs[1])
            attr_description = attr_attrs[1] + " ranges from"
            if attr_attrs[0] == "Low"
              attr_value = formatted_value_with_attr(av, av.attr_name) + " to " + formatted_value_with_attr(opp_av, av.attr_name)
            else
              attr_value = formatted_value_with_attr(opp_av, av.attr_name) + " to " + formatted_value_with_attr(av, av.attr_name)
            end
          else
            # => the 11 in front of the pluralize is to force it to treat it as... a plural.
            # logger.debug "no opposite, going to determine which side of the range and print\n\n\n"
            attr_attrs[0]=="Low" ? attr_description = attr_attrs[1].pluralize + " starting at" : attr_description = attr_attrs[1].pluralize + " under"
            attr_value = formatted_value_with_attr(av,av.attr_name)
          end
        end
        
      else
        attr_description = an_name
        attr_value = formatted_value_with_attr(av, av.attr_name)
      end  
      
      formatted_list.push({:attr_description => attr_description, :attr_value => attr_value})
      # logger.debug "the list thus far is: #{formatted_list}\n\n\n"
    end
    formatted_list
  end

  def formatted_value_with_attr(av,an)
    #@an = AttrName.find_by_id(iav.attr_name_id)
    case an.value_type
    when "INTEGER"
      if an.treat_as_price
        humanized_money_with_symbol av.price_val
      else
        av.int_val
      end
      #iav.int_val ? iav.int_val : iav.price_val
    when "BOOLEAN"
      av.boolean_val
    when "DATETIME"
      av.datetime_val
    when "FLOAT"
      av.float_val
    else
      av.string_val
    end
  end



end
