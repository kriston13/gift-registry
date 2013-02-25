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

  def update
  end
end
