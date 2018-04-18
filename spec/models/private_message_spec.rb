require 'rails_helper'
RSpec.describe PrivateMessage, type: :model do
  it 'PrivateMessage belong to User' do
    expect(subject).to belong_to(:user)
  end
  it 'PrivateMessage belong to private_chat_room' do
    expect(subject).to belong_to(:private_chat_room)
  end
  it 'validates the body on presence ' do
    should validate_presence_of(:content)
  end
  it 'validates the body on min length ' do
    should validate_length_of(:content).is_at_least(2)
  end

  it 'validates the body on max length ' do
    should validate_length_of(:content).is_at_most(1000)
  end
end
