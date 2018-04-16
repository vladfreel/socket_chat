class ChatRoom < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :memberships
  has_many :private_chat_rooms, through: :memberships
  has_many :messages, dependent: :destroy
end
