require 'rails_helper'
RSpec.describe Message, type: :model do


  it 'Message belong to User' do
    expect(subject).to belong_to(:user)
  end

  it 'Message belong to chat_room' do
    expect(subject).to belong_to(:chat_room)
  end

  it 'validates the body on presence ' do
    should validate_presence_of(:body)
  end
  it 'validates the body on min length ' do
    should validate_length_of(:body).is_at_least(2)
  end

  it 'validates the body on max length ' do
    should validate_length_of(:body).is_at_most(1000)
  end

end
