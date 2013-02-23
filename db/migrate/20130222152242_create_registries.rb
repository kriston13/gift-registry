class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :name
      t.string :description
      t.date :startdate
      t.date :enddate
      t.boolean :public
      t.integer :interest_interval
      t.integer :max_interest
      t.integer :owner_id

      t.timestamps
    end
  end
end
