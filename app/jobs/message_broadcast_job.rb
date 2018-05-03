class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, user)
    p '*' * 100
    p user
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                 message: render_message(message, user)
  end

  private

  def render_message(message, user)
    MessagesController.render(partial: 'messages/message', locals: {message: message, current_user: user })
  end
end