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
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
