class Booking < ActiveRecord::Base
  #attr_accessible :booking_date, :booking_expiry_date, :registry_item_id, :user_id
  
  belongs_to :registry_item
  belongs_to :user
  
  before_save :set_expiry_date
  
  
  def set_expiry_date
    if self.confirmed != true
      logger.debug "about to set expiry time"
      self.booking_expiry_date = Time.now + GiftRegistry::DEFAULT_EXPIRY_TIME
      logger.debug "setting to false"
      self.confirmed = false
    end
    true
  end
  
  def self.has_been_confirmed?(registry_item_id)
    Booking.where("registry_item_id = ? AND confirmed = ?", registry_item_id, true).size > 0 ? true : false
  end
  
  def self.valid_bookings(registry_item_id)
    @valid_bookings = Booking.where("registry_item_id = ? AND booking_expiry_date > ? AND confirmed != ?", registry_item_id, Time.now, true)
  end
  
end
