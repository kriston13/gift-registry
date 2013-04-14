class Booking < ActiveRecord::Base
  #attr_accessible :booking_date, :booking_expiry_date, :registry_item_id, :user_id
  
  belongs_to :registry_item
  belongs_to :user
  
  before_save :set_expiry_date
  
  
  def set_expiry_date
    self.booking_expiry_date = Time.now + GiftRegistry::DEFAULT_EXPIRY_TIME
  end
  
  def self.valid_bookings(registry_item_id)
    @valid_bookings = Booking.where("registry_item_id = ? AND booking_expiry_date > ?", registry_item_id, Time.now)
  end
  
end
