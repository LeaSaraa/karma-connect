class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
      message: message.content,
      user: message.user.first_name,
      url: message.user.upload_avatar.url
      head :ok
    else
      redirect_to chatrooms_path
    end
  end

  def index
    @messages = @chatroom.messages
    @message = @chatroom.messages.new
  end

  def new
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
