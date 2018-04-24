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

  describe '#title' do
    it 'should validate presence' do
      record = ChatRoom.new
      record.title = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:title]).to include("can't be blank")
      record.title = 'cars' # valid state
      record.valid? # run validations
      expect(record.errors[:title]).not_to include("can't be blank")
    end
  end
end
