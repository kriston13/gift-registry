class BookingsController < ApplicationController

  before_filter :get_registry_and_registry_items

  def create
    #sleep(2.seconds)
    @booking = @registry_item.bookings.build
    @booking.user_id = current_user.id
    @booking.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    #sleep(2.seconds)
    @booking = Booking.find_by_id(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @booking = Booking.find_by_id(params[:id])
    if @booking.confirmed == true
      @booking.confirmed = false
    else
      @booking.confirmed = true
    end
    @booking.save
    respond_to do |format|
      format.js
    end
  end


  private

    def available_to_book?
      Booking.valid_bookings(@registry_item.id) == 0 ? true : false
    end

    def booked?
      Booking.valid_bookings(@registry_item.id) > 0 ? true : false
    end
    
    def get_registry_and_registry_items
      @registry = Registry.find_by_id(params[:registry_id])
      @registry_item = RegistryItem.find_by_id(params[:registry_item_id])
    end

end
