require 'rails_helper'
RSpec.describe MultiUserPrivateChatRoom, type: :model do

  it 'validates the title ' do
    expect(subject).to validate_presence_of(:name)
  end

  it 'validates the body on max length ' do
    should validate_length_of(:name).is_at_most(30)
  end

  it { should validate_uniqueness_of(:name) }

  it 'Chat_Room has many images' do
    expect(subject).to have_many(:multi_user_messages).dependent(:destroy)
  end

  it 'PrivateMessage belong to User' do
    expect(subject).to belong_to(:user)
  end

  it 'Category has many users through subscribes' do
    expect(subject).to have_many(:multi_user_memberships)
  end

  it 'Category has many users through subscribes' do
    expect(subject).to have_many(:users).through(:multi_user_memberships)
  end

  describe '#name' do
    it 'should validate presence' do
      record = MultiUserPrivateChatRoom.new
      record.name = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:name]).to include("can't be blank")
      record.name = '****************************************************************************************'
      record.valid? # run validations
      expect(record.errors[:name]).to include("is too long (maximum is 30 characters)")
      record.name = 'cars' # valid state
      record.valid? # run validations
      expect(record.errors[:name]).not_to include("can't be blank")
    end
  end

end
