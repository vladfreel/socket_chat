require 'rails_helper'
RSpec.describe MultiUserMembership, type: :model do
  it 'Membership belong to User(owner) by foreign key user_id' do
    expect(subject).to belong_to(:user)
  end
  it 'Membership belong to User(member) by foreign key user_id' do
    expect(subject).to belong_to(:multi_user_private_chat_room)
  end
end
