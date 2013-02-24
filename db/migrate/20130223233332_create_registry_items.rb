class CreateRegistryItems < ActiveRecord::Migration
  def change
    create_table :registry_items do |t|
      t.integer :registry_id
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
