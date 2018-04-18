class PrivateChatRoom < ApplicationRecord
  has_one :membership
  has_many :users, through: :membership
  accepts_nested_attributes_for :membership
  has_many :private_messages
  validates :name, presence: true, length: { maximum: 30}, uniqueness: true


end
