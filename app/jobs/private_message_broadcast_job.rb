class PrivateMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(private_message)
    ActionCable.server.broadcast "private_chat_rooms_#{private_message.private_chat_room.id}_channel",
                                 private_message: render_private_message(private_message)
  end

  private

  def render_private_message(private_message)
    PrivateMessagesController.render partial: 'private_messages/private_message', locals: {private_message: private_message}
  end
end