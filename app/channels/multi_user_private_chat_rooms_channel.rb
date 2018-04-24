# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MultiUserPrivateChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "multi_user_private_chat_rooms_#{params['multi_user_private_chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_multi_user_message(data)
    current_user.multi_user_messages.create!(content: data['multi_user_message'], multi_user_private_chat_room_id: data['multi_user_private_chat_room_id'])
  end
end