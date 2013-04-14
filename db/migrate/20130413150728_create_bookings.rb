class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :registry_item_id
      t.integer :user_id
      t.datetime :booking_date
      t.datetime :booking_expiry_date

      t.timestamps
    end
  end
end
