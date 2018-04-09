class RidesController < ApplicationController
before_action :current_user
	def create
		@attraction = Attraction.find(params[:attraction_id])
		@ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
		flash[:notice] = @ride.take_ride
		# binding.pry
		redirect_to user_path(@current_user)
	end

end