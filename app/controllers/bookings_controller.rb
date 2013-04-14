class BookingsController < ApplicationController

  def create
    @booking = @registry_item.bookings.build
    @booking.user_id = @current_user.id
    if @booking.save
      
    else
      flash[:notice] = "There was a problem creating this booking. You might have to try again."
    end
    
  end

  def destroy
    #@
  end

  private
  


  def available_to_book?
    #TODO
  end

  def booked?
    #TODO
  end

end
