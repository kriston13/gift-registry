class AddPriceValToItemAttrVal < ActiveRecord::Migration
  def change
    add_money :item_attr_vals, :price_val
  end
end
