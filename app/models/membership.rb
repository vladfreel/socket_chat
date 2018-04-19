class Membership < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :member, class_name: 'User'
  belongs_to :private_chat_room
  validates_uniqueness_of :owner_id, scope: :member_id
end
