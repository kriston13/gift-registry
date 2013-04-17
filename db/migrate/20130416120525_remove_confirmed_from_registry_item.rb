class RemoveConfirmedFromRegistryItem < ActiveRecord::Migration
  def up
    remove_column :registry_items, :confirmed
  end

  def down
    add_column :registry_items, :confirmed, :boolean
  end
end
