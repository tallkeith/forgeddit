class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		render :new
	end

	def create
		@comment = Comment.new(user_id: params["user_id"], post_id: params["post_id"], content: params["content"])
		 if @comment.save
      redirect_to post_path(@post)
    else
      render :new
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