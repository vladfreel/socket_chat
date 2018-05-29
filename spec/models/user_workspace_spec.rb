require 'rails_helper'

RSpec.describe UserWorkspace, type: :model do
  let(:user_workspace) { create(:user_workspace, user: create(:user), workspace: create(:workspace)) }

  describe 'Associations' do
    it { expect(user_workspace).to belong_to(:user) }
    it { expect(user_workspace).to belong_to(:workspace) }
  end
end
