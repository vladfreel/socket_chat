class Membership < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :member, :class_name => 'User'
  belongs_to :private_chat_room

  validates_presence_of :private_chat_room_id
  validates_presence_of :owner, scope: :private_chat_room_id
  validates_presence_of :member, scope: :private_chat_room_id
end
