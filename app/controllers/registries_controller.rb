class RegistriesController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  before_filter :current_user, :path_user, only: [:index, :show]
  #before_filter :find_current_user
  
  def new
    logger.debug "@current_user is: #{@current_user.id}"
    #@registry = Registry.new(:owner_id => @current_user.id)
    @registry = @current_user.registries.build
  end

  def create
    @registry = @current_user.registries.build(params[:registry])
    if @registry.save
      redirect_to user_registry_path(@current_user,@registry), notice: "Registry created successfully!"
    else
      render "new"
    end
  end

  def show
    logger.debug "LOADING SHOW-------"
    logger.debug "the registry id is: #{params[:id]}"
    #@path_user = User.find_by_id(params[:user_id])
    @registry = Registry.find_by_id(params[:id])
    logger.debug "@registry is: #{@registry.name}"
  end

  def index
    logger.debug "LOADING SHOW-------"
    #logger.debug "the registry id is: #{params[:id]}"
    if @current_user
      logger.debug "current user is #{@current_user.id}"
    else
      logger.debug "no current user?"
    end
    #@path_user = User.find_by_id(params[:user_id])
    @path_registries = @path_user.registries
    
  end

  def update
  end

  def destroy
  end

private
  def path_user
    @path_user = User.find_by_id(params[:user_id])
  end

end
