class AttrNamesController < ApplicationController
  def index
    @attr_names = AttrName.find(:all)
    logger.debug { "attribute names are: #{@attr_names.first}" }
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end
end
