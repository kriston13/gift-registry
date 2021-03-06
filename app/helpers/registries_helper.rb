module RegistriesHelper

  def is_owner?
    if @path_user == nil
      #logger.debug "no user in path, going to find through registry owner"
      @path_user = User.find_by_id(@registry.owner_id)
      #logger.debug "first name is #{@path_user.firstname}"
    end
    
    if current_user != nil
      #logger.debug "current user is not nil"
      @current_user = current_user
      #logger.debug "first name of current user is #{@current_user.firstname}"
      @current_user.id == @path_user.id ? true : false
    else
      false
    end
  end

  def owner_text
    if is_owner?
      "Your"
    else
      @path_user.firstname + "'s"
    end
  end

end
