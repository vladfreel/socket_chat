class MultiUserMembership < ApplicationRecord

  belongs_to :user
  belongs_to :multi_user_private_chat_room

  validates_uniqueness_of :multi_user_private_chat_room_id, scope: :user_id

end
