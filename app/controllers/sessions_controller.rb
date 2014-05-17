class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(:username => params[:signin][:username]).first

		if user && user.authenticate(params[:signin][:password])
			session[:user_id] = user.id
			flash[:notice] = "Signed in successfully"
			redirect_to root_url
		else
			flash[:error] = "Sorry"
			render :new
		end
	end
end
