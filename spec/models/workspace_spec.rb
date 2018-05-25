require 'rails_helper'

RSpec.describe Workspace, type: :model do
  let(:workspace) { create(:workspace) }

  describe 'Associations' do
    it { expect(workspace).to have_many(:user_workspaces) }
    it { expect(workspace).to have_many(:users).through(:user_workspaces) }
  end
end
