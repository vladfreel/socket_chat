class Workspace < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  # has_many :users
  # has_many :channels
  # has_many :direct_messages

end
