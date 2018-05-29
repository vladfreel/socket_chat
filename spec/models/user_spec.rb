require 'rails_helper'
RSpec.describe User, type: :model do
  it 'User has many comments' do
    expect(subject).to have_many(:chat_rooms).dependent(:destroy)
  end
  it 'User has many categories ' do
    expect(subject).to have_many(:private_chat_rooms).through(:memberships)
  end
  it 'User has many likes' do
    expect(subject).to have_many(:messages).dependent(:destroy)
  end
  it 'User has many likes' do
    expect(subject).to have_many(:private_messages).dependent(:destroy)
  end

  it 'validates the email ' do
    expect(subject).to validate_presence_of(:username)
  end
  it 'validates the title ' do
    expect(subject).to validate_presence_of(:username)
  end
  it { is_expected.to allow_value("vladfree").for(:username) }

  it { is_expected.to_not allow_value("./,91$32").for(:username) }

  it 'SEARCH' do
    user = create(:user)
    user.__elasticsearch__.index_document
    User.__elasticsearch__.refresh_index! # Manually refresh the index instead of waiting
    expect(User.search(user.username).results.map(&:_id)).to include(user.id.to_s)
  end
end