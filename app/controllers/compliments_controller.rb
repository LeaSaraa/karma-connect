class ComplimentsController < ApplicationController
  before_action :set_user, only: [:new, :create, :index]
  def new
    @compliment = Compliment.new
  end

  def create
    @compliment = Compliment.new(compliment_params)
    @compliment.user = User.find(params[:user_id])
    @compliment.sender = current_user
    @compliment.user.karma_points += @compliment.points
    if @compliment.save
      # @compliment.user.save
      redirect_to user_path(@compliment.user)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def index
    @compliments = Compliment.all
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def compliment_params
    params.require(:compliment).permit(:text, :points)
  end
end
