class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		
	end

	def create
    @post = Post.find(params["id"])
    if current_user
    	@post.comments.create(content: params["content"])
			render :new
		else
			flash[:notice] = "You have to login to do that."
			redirect_to posts_path(@post)
		end
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