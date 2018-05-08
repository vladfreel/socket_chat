class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def update
    message = Message.find(params[:id])
    message.update!(message_params)
    redirect_to chat_room_path(message.chat_room.id)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to chat_room_path(message.chat_room.id)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end