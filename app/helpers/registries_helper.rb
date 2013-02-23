module RegistriesHelper

  def is_owner?
    if current_user != nil
      logger.debug "current user is not nil"
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
