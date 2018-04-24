class MultiUserMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(multi_user_message)
    ActionCable.server.broadcast "multi_user_private_chat_rooms_#{multi_user_message.multi_user_private_chat_room.id}_channel",
                                 multi_user_message: render_multi_user_message(multi_user_message)
  end

  private

  def render_multi_user_message(multi_user_message)
    MultiUserMessagesController.render partial: 'multi_user_messages/multi_user_message', locals: {multi_user_message: multi_user_message}
  end
end