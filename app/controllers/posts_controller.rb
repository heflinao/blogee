class PostsController < ApplicationController
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
  
  def show
    @post = Post.find(params[:id])
  end
 
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:success] = "Project has been destroyed."
		redirect_to posts_path
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
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
  
  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
end
