class RegistryItemsController < ApplicationController
  before_filter :get_registry
  before_filter :authorize
  
  def show
  end

  def new
    @item = @registry.registry_items.build()
    #pp "#{@item.registry_id}"
    #binding.pry
    #debugger
    @item.item_attr_vals.build
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
  
  def edit
    @item = RegistryItem.find_by_id(params[:id])
  end
  
  def update
    @item = RegistryItem.find_by_id(params[:id])
    if @item.update_attributes(params[:registry_item])
      redirect_to registry_path(@registry), notice: "Item has been updated"
    else
      render 'edit'
    end
  end
  
  
private

  def get_registry
    @registry = Registry.find_by_id(params[:registry_id])
  end

end
