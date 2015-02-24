
class UsersController < ApplicationController
	
	def index
		if current_user
			@user = current_user
		else
    	redirect_to new_user_path, notice: "Please log in"
  	end
	end

	def new
		render 'new'
	end

	def show
	end


end