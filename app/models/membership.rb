class Membership < ApplicationRecord

  belongs_to :user
  belongs_to :private_chat_room

  validates_presence_of :room_id
  validates_presence_of :user_id

end
