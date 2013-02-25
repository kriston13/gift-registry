class CreateAttrNames < ActiveRecord::Migration
  def change
    create_table :attr_names do |t|
      t.string :description
      t.string :value_type
      t.boolean :link

      t.timestamps
    end
  end
end
