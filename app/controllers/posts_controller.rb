class PostsController < ApplicationController
	
	def index
		@posts = Post.all
		render :index
	end
	
	def new
		@post = Post.new
		render :new
	end

	def create
		@post = Post.create(title: params["title"], content: params["content"], url: params["url"])
		redirect_to posts_path(@post.id)
	end

	def edit
	end

	def update 
	end

	def destroy
	end

	def show
		@post = Post.find(params["id"])
		render :show
	end



end