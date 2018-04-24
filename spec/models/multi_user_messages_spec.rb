require 'rails_helper'
RSpec.describe MultiUserMessage, type: :model do
  it 'PrivateMessage belong to User' do
    expect(subject).to belong_to(:user)
  end
  it 'PrivateMessage belong to private_chat_room' do
    expect(subject).to belong_to(:multi_user_private_chat_room)
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
  describe '#body' do
    it 'should validate presence' do
      record = MultiUserMessage.new
      record.content = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:content]).to include("can't be blank")
      record.content = '1' # invalid state
      record.valid? # run validations
      expect(record.errors[:content]).to include("is too short (minimum is 2 characters)")
      record.content = '******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************' # invalid state
      record.valid? # run validations
      expect(record.errors[:content]).to include("is too long (maximum is 1000 characters)")
      record.content = 'cars' # valid state
      record.valid? # run validations
      expect(record.errors[:content]).not_to include("can't be blank")
    end
  end
end
