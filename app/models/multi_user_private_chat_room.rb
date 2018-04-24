class MultiUserPrivateChatRoom < ApplicationRecord
  has_many :multi_user_memberships, dependent: :destroy
  has_many :multi_user_messages, dependent: :destroy
  belongs_to :user
  has_many :users, through: :multi_user_memberships
  validates :name, presence: true, length: { maximum:30}, uniqueness: true
end
