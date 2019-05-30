class PostsStatusController < ApplicationController
  def create
     @post = Post.new(post_params)
     @post.user = current_user
      if @post.save
        respond_to do |format|
          format.html { redirect_to my_post_path }
          format.js  # <-- will render `app/views/reviews/create.js.erb`
        end
      else
        respond_to do |format|
        format.html { render :new }
        format.js  # <-- idem
      end
    end
  end
end
