class ComplimentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @compliment = Compliment.new
  end

  def create
    @compliment = Compliment.new(compliment_params)
    @compliment.user = User.find(params[:user_id])
    if @compliment.save
      redirect_to user_path(@compliment.user)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def compliment_params
    params.require(:compliment).permit(:text, :points)
  end
end
