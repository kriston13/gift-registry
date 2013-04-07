class RegistriesController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  before_filter :current_user, :path_user, only: [:index, :show]
  #before_filter :find_current_user
  
  def new
    @registry = @current_user.registries.build
  end

  def create
    @registry = @current_user.registries.build(params[:registry])
    if @registry.save
      redirect_to registry_path(@registry), notice: "Registry created successfully!"
    else
      render "new"
    end
  end

  def show
    @registry = Registry.includes({:registry_items => {:item_attr_vals => :attr_name}}).find_by_id(params[:id])
  end

  def edit
    @registry = Registry.find_by_id(params[:id])
    owner_check
  end

  def update
    @registry = Registry.find_by_id(params[:id])
    owner_check
    if @registry.update_attributes(params[:registry])
      redirect_to registry_path(@registry), notice: "Registry has been updated"
    else
      render 'edit'
    end
  end


  def index
    #logger.debug "LOADING INDEX-------"
    #logger.debug "the registry id is: #{params[:id]}"
    if @current_user
      logger.debug "current user is #{@current_user.id}"
    else
      logger.debug "no current user?"
    end
    #@path_user = User.find_by_id(params[:user_id])
    @path_registries = @path_user.registries
    
  end

  def destroy
  end

private
  def path_user
    @path_user = User.find_by_id(params[:user_id])
  end

  def owner_check
    @registry.owner_id == @current_user.id ? true : (redirect_to user_registries_path(@current_user), notice: "You can only edit your own registries")
  end

end
