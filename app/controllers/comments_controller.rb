class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		if current_user
			render :new
		else
			flash[:notice] = "You have to login to do that."
			redirect_to posts_path(@post)
		end
	end

	def create
    @post = Post.find(params["id"])
    @post.comments.create(content: params["content"])
    redirect_to posts_path(@post)
  end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end


end