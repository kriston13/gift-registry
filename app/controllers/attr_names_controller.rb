class AttrNamesController < ApplicationController
  def index
    @attr_names = AttrName.find(:all)
    logger.debug { "attribute names are: #{@attr_names.first}" }
  end

  def new
    @attr_name = AttrName.new
  end

  def create
    @attr_name = AttrName.new(params[:attr_name])
    if @attr_name.save
      redirect_to attr_names_path, notice: "Successfully created a new attribute"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @attr_name = AttrName.find_by_id(params[:id])
  end

  def update
    @attr_name = AttrName.find_by_id(params[:id])
    if @attr_name.update_attributes(params[:attr_name])
      redirect_to attr_names_path, notice: "Attribute has been updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @attr_name = AttrName.find_by_id(params[:id])
    @attr_name.destroy
    redirect_to attr_names_path, notice: "Attribute has been deleted"
  end
  
end
