class RidesController < ApplicationController
  before_action :authentication_required

 def create
   ride = Ride.create(ride_params)
   if ride
       message = ride.take_ride
       redirect_to user_path(ride.user), flash: { message: message }
   else
       redirect_to attraction_path(ride.attraction)
   end

 end

 private

  def ride_params
    params.require(:ride).permit(
    :user_id,
    :attraction_id
    )
  end

end
