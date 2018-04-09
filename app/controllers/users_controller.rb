class UsersController < ApplicationController

	before_action :require_login, only: [:show]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			# binding.pry
			session[:user_id] = @user.id
			# binding.pry
			redirect_to user_path(@user)
		else
			
			redirect_to "/"
		end

	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
	end


	


end