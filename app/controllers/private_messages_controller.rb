class PrivateMessagesController < ApplicationController
  def update
    message = PrivateMessage.find(params[:id])
    message.update!(private_message_params)
    redirect_to private_chat_room_path(message.private_chat_room.id)
  end

  def destroy
    message = PrivateMessage.find(params[:id])
    message.destroy
    redirect_to private_chat_room_path(message.private_chat_room.id)
  end
  private

  def private_message_params
    params.require(:private_message).permit(:content)
  end
end
