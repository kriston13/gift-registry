require 'spec_helper'

describe Booking do

  it "has a valid factory" do
    FactoryGirl.create(:booking).should be_valid
  end
  
  it "has a valid factory that creates bookings expiring in the past and in the future" do
    @valid_booking = FactoryGirl.create(:booking)
    
    Timecop.freeze(4.days.ago)
    #puts "the time is now #{Time.now}"
    @expired_booking = FactoryGirl.create(:booking)
    #puts "the expired_booking expiry time is: #{@expired_booking.booking_expiry_date}"
    
    Timecop.return
    #puts "the time is now #{Time.now}"
    
    @expired_booking.booking_expiry_date.should < Time.now
    @valid_booking.booking_expiry_date.should > Time.now
    
    @expired_booking.confirmed.should == false
    @valid_booking.confirmed.should == false
  end
  
  it "returns true if there is a confirmed booking on a registry item" do
    FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 4)
    FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 5)
    
    FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 6, :confirmed => true)
    
    Timecop.freeze(5.days.ago) do
      FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 4)
      FactoryGirl.create(:booking, :registry_item_id => 4, :user_id => 4)
    end
    
    FactoryGirl.create(:booking, :registry_item_id => 4, :user_id => 6)
    
    Booking.has_been_confirmed?(3).should be_true
  end

  it "returns a list of unexpired bookings for a registry item" do
    FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 4)
    FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 5)
    
    FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 6, :confirmed => true)
    
    Timecop.freeze(5.days.ago) do
      FactoryGirl.create(:booking, :registry_item_id => 3, :user_id => 4)
      FactoryGirl.create(:booking, :registry_item_id => 4, :user_id => 4)
    end
    
    FactoryGirl.create(:booking, :registry_item_id => 4, :user_id => 6)
    
    @valid_bookings = Booking.valid_bookings(3)

    @valid_bookings.size.should == 2
  end



end
