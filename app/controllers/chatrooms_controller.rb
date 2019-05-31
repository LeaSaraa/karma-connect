class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    first_try = Chatroom.where(sender_id: current_user.id, receiver_id: params[:chatroom][:receiver_id]).first
    second_try = Chatroom.where(sender_id: params[:chatroom][:receiver_id], receiver_id: current_user.id).first
    if first_try
      redirect_to chatroom_path(first_try)
    elsif second_try
      redirect_to chatroom_path(second_try)
    else
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.sender = current_user
      if @chatroom.save!
        respond_to do |format|
          format.html { redirect_to @chatroom }
          format.js
        end
      else
        respond_to do |format|
          format.html { redirect_to new_chatroom_path }
          format.js { render template: 'chatrooms/chatroom_error.js.erb'}
        end
      end
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic, :receiver_id, :sender_id)
  end
end
