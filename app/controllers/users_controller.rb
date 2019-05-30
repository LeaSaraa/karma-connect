class UsersController < ApplicationController
  before_action :set_user

  def show
    @neighbourhood = @user.neighbourhood
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def edit
    redirect_to user_path(@user)
    render "show"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :upload_avatar, :personal_info)
  end
end
