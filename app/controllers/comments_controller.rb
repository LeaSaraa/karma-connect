class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_path(@comment.post)
      flash[:notice] = "Succesfully saved comment!"
    else
      render :new
      flash[:alert] = "Something went wrong, please try again"
    end
    # if
    #   respond_to do |format|
    #     format.html { redirect_to posts_path(@post_id) }
    #     format.js
    #   end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
