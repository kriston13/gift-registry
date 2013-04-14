class AddConfirmedToRegistryItem < ActiveRecord::Migration
  def change
    add_column :registry_items, :confirmed, :boolean
  end
end
