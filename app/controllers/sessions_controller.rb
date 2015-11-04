class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find(email: params[:email])
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			redirect_to root_path, notice: 'signed in'
		else
			redirect_to signin_path, notice: 'there was a problem signing you in'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: 'signed out'
	end

end