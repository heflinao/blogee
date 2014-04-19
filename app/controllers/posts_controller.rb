class PostsController < ApplicationController

	before_action :get_post, only: [:show, :destroy, :edit, :update]

  def index
		@posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
			flash[:success] = "new post created"
			redirect_to post_path(@post)
		else
			flash[:error] = "can't save without content"
			render "new"
		end
  end
 
	def destroy
		@post.destroy
		flash[:success] = "Project has been destroyed."
		redirect_to posts_path
	end

	def update
		@post.update(post_params)

    if @post.save
			flash[:success] = "Pust has been updated"
			redirect_to @post
		else
			flash[:error] = "can't save without content"
			render "edit"
		end
	end

  private
  
	def get_post
		@post = Post.find(params[:id])
	end

  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
end
