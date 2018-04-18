require 'rails_helper'
RSpec.describe PrivateChatRoom, type: :model do

  it 'validates the title ' do
    expect(subject).to validate_presence_of(:name)
  end
  it 'validates the body on max length ' do
    should validate_length_of(:name).is_at_most(30)
  end
  it { should validate_uniqueness_of(:name) }
  it 'Chat_Room has many images' do
    expect(subject).to have_many(:private_messages).dependent(:destroy)
  end
  it 'Category has many users through subscribes' do
    expect(subject).to have_one(:owner).through(:membership)
  end
  it 'Category has many users through subscribes' do
    expect(subject).to have_one(:member).through(:membership)
  end
  it 'Category has many users through subscribes' do
    expect(subject).to have_one(:membership)
  end
  it 'accepts_nested_attributes_for Category' do
    expect(subject).to accept_nested_attributes_for :membership
  end

  describe '#name' do
    it 'should validate presence' do
      record = PrivateChatRoom.new
      record.name = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:name]).to include("can't be blank")
      record.name = 'cars' # valid state
      record.valid? # run validations
      expect(record.errors[:name]).not_to include("can't be blank")
    end
  end

end
