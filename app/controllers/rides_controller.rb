class RidesController < ApplicationController
  before_action :authentication_required

 def create
   ride = Ride.create(ride_params)
   message = ride.take_ride
   redirect_to user_path(ride.user), flash: { message: message }
 end

end
