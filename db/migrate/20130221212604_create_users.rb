class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.string :salt
      t.boolean :enabled
      t.datetime :lastlogin
      t.integer :attempts

      t.timestamps
    end
  end
end
