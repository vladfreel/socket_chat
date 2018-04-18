class PrivateChatRoom < ApplicationRecord
  has_one :membership
  has_one :owner, class_name: 'User', through: :membership
  has_one :member, class_name: 'User', through: :membership
  accepts_nested_attributes_for :membership
  has_many :private_messages, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30}, uniqueness: true

  def self.check_owner_private_chat(owner, member)
    Membership.find_by(owner_id: owner, member_id: member)
  end
  def self.check_member_private_chat(owner, member)
    Membership.find_by(owner_id: member, member_id: owner)
  end
end
