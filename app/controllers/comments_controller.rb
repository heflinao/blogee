class CommentsController < ApplicationController
	before_action :get_post
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def new
		@comment = @post.comments.build
	end

	def create
		@comment = @post.comments.build(comment_params)
		if @comment.save
			flash[:notice] = "Comment has been saved."
			redirect_to @post
		else
			flash[:alert] = "Comment has not been saved."
			render "new"
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			flash[:notice] = "Comment has been updated."
			redirect_to post_path(@post) 
		else
			flash[:error] = "Comment has not been updated."
			redirect_to edit_post_path(@post)
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Comment has been deleted."

		redirect_to @post
	end

	private
	def get_post
		@post = Post.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit(:author, :content)
	end

	def set_comment
		@comment = @post.comments.find(params[:id])
	end
end
