class CreateItemAttrVals < ActiveRecord::Migration
  def change
    create_table :item_attr_vals do |t|
      t.integer :registry_item_id
      t.integer :attr_name_id
      t.string :raw_value
      t.string :string_val
      t.float :float_val
      t.integer :int_val
      t.boolean :bool_val
      t.datetime :datetime_val
      t.timestamps
    end
  end
end
