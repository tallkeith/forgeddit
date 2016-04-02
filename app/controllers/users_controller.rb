class UsersController < ApplicationController
	def new
		@user = User.new
		render :new
	end	

	def create
		@user = User.new(username: params["username"], email: params["email"], password: params["password"])
    if @user.save
      redirect_to :root
    else
      render :new
    end
	end

end