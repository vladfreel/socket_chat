class MultiUserPrivateChatRoom < ApplicationRecord
  has_many :multi_user_memberships
  has_many :multi_user_messages
  belongs_to :user
  has_many :users, through: :multi_user_memberships
  accepts_nested_attributes_for :multi_user_memberships
  validates :name, presence: true, length: { maximum: 20}, uniqueness: true
end
