class ChatRoom < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :messages, dependent: :destroy
end
