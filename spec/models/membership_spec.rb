require 'rails_helper'
RSpec.describe Membership, type: :model do
  it 'Membership belong to User(owner) by foreign key user_id' do
    expect(subject).to belong_to(:owner).class_name('User')
  end
  it 'Membership belong to User(member) by foreign key user_id' do
    expect(subject).to belong_to(:member).class_name('User')
  end
  it 'Membership belong to private_chat_room' do
    expect(subject).to belong_to(:private_chat_room)
  end
end
