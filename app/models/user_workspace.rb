class UserWorkspace < ApplicationRecord
  enum role: { primary_owner: 0, member: 1 }

  belongs_to :user
  belongs_to :workspace
end
