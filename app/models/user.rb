class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :memberships
  has_many :private_chat_rooms, through: :memberships
  has_many :private_messages, dependent: :destroy

  has_many :multi_user_memberships
  has_many :multi_user_private_chat_rooms, through: :multi_user_memberships
  has_many :multi_user_messages, dependent: :destroy
end
