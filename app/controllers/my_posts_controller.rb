class MyPostsController < ApplicationController
  before_action :set_post, only: [:active, :done]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.status = "Active"
      if @post.save
        flash[:notice] = 'Post has been saved.'
        redirect_to posts_path
      else
        render :new
      end
  end

  def index
    # if @user == current_user
    @posts = Post.all.order("created_at DESC")
    # end
  end

  def active
    @post.status = 'Active'
    @post.save
    redirect_to my_posts_path
  end

  def done
    @post.status = 'Done'
    @post.save
    redirect_to my_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :address, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
