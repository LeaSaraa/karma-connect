class MyPostsController < ApplicationController
  def index
    # if @user == current_user
      @posts = Post.all
    # end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
      if @post.save
        flash[:notice] = 'Post has been saved.'
        redirect_to posts_path
      else
        render :new
      end
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :address, :description)
  end
end
