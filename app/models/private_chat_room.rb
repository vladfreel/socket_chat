class PrivateChatRoom < ApplicationRecord
  has_one :membership
  has_many :messages
  has_many :users, through: :membership

  validates :name, presence: true, length: { maximum: 30}, uniqueness: true
  accepts_nested_attributes_for :membership

end
