class UsersController < ApplicationController
	def index
		@users = User.all.order("created_at").reverse_order
		render :index
	end

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

	def edit
		@user = User.find(params["id"])
	end

	def update
		@user = User.find(params["id"])
    @user.update(username: params["username"], email: params["email"], password: params["password"])
    redirect_to users_show_path(@user.id)
	end

	def show
		@user = User.find(params["id"])
		render :show
	end


end