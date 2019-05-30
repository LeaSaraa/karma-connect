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

    @posts = @posts.where.not(latitude: nil, longitude: nil)
    # @posts = Post.where.not(latitude: nil, longitude: nil)

    @markers = @posts.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { post: post })
      }
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
