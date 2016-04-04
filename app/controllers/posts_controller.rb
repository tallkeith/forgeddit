class PostsController < ApplicationController
	
	def index
		@posts = Post.all.order("created_at").reverse_order
		render :index
	end
	
	def new
		@post = Post.new
		if current_user
			render :new
		else
			flash[:notice] = "You have to login to do that."
			redirect_to :root
		end
	end

	def create
		@post = Post.create(title: params["title"], content: params["content"], url: params["url"])
		redirect_to posts_path(@post.id)
	end

	def edit
		@post = Post.find(params["id"])
	end

	def update 
		@post = Post.find(params["id"])
    @post.update(title: params["title"], content: params["content"], url: params["url"])
    redirect_to posts_path(@post.id)
	end

	def destroy
		@post = Post.find(params["id"])
		@post.destroy
		redirect_to :root
	end

	def show
		@post = Post.find(params["id"])
		render :show
	end



end