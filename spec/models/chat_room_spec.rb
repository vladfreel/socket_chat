require 'rails_helper'
RSpec.describe ChatRoom, type: :model do
  it 'validates the title ' do
    expect(subject).to validate_presence_of(:title)
  end
  it 'Chat_Room has many images' do
    expect(subject).to have_many(:messages).dependent(:destroy)
  end
  it 'Category belong to User(owner) by foreign key user_id' do
    expect(subject).to belong_to(:user)
  end
end
