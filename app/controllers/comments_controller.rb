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
    @post =  Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post) }
        format.js
        flash[:notice] = "Succesfully saved comment!"
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
        flash[:alert] = "Something went wrong, please try again"
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
