class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  # after_create_commit { MessageBroadcastJob.perform_later(self, current_user) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
  def to_message_json
    {
        body: body,
        user_id: user_id,
        chat_room: chat_room_id
    }
  end

end
