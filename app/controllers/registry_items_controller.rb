class RegistryItemsController < ApplicationController
  before_filter :get_registry
  
  def show
  end

  def new
    @item = @registry.registry_items.build()
  end

  def create
    @item = @registry.registry_items.build(params[:registry_item])
    if @item.save
      redirect_to registry_path(@registry)
    else
      render 'new'
    end
  end

  def destroy
    @item = RegistryItem.find(params[:id])
    @item.destroy
    redirect_to registry_path(@registry)
  end
  
private

  def get_registry
    @registry = Registry.find_by_id(params[:registry_id])
  end

end
