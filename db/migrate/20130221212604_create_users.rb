class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.boolean :enabled
      t.datetime :lastlogin
      t.integer :attempts

      t.timestamps
    end
  end
end
