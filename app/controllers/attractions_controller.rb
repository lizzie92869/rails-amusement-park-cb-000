class AttractionsController < ApplicationController
	before_action :current_user
	def index
		# binding.pry
		@attractions = Attraction.all
		@attraction = Attraction.new
	end

	def show
		@attraction = Attraction.find(params[:id])
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.create(name: params[:attraction][:name], nausea_rating: params[:attraction][:nausea_rating], happiness_rating: params[:attraction][:happiness_rating], tickets: params[:attraction][:tickets], min_height: params[:attraction][:min_height])
		redirect_to attraction_path(@attraction)
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		@attraction.update(name: params[:attraction][:name], nausea_rating: params[:attraction][:nausea_rating], happiness_rating: params[:attraction][:happiness_rating], tickets: params[:attraction][:tickets], min_height: params[:attraction][:min_height])
		redirect_to attraction_path(@attraction)
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
	end


end