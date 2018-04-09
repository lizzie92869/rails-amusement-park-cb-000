class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		# binding.pry
		@user = User.find_by(name: params[:user][:name])
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def destroy
		session[:user_id]=nil
		redirect_to '/'
	end


end