class PostsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        posts.title ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
      "
      @posts = Post.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
    @posts = Post.all
    end
  end
end
