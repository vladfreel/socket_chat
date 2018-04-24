# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PrivateChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "private_chat_rooms_#{params['private_chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_private_message(data)
    current_user.private_messages.create!(content: data['private_message'], private_chat_room_id: data['private_chat_room_id'])
  end
end