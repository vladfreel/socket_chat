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
  describe '#body' do
    it 'should validate presence' do
      record = Message.new
      record.body = '' # invalid state
      record.valid? # run validations
      expect(record.errors[:body]).to include("can't be blank")
      record.body = '1' # invalid state
      record.valid? # run validations
      expect(record.errors[:body]).to include("is too short (minimum is 2 characters)")
      record.body = '******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************' # invalid state
      record.valid? # run validations
      expect(record.errors[:body]).to include("is too long (maximum is 1000 characters)")
      record.body = 'cars' # valid state
      record.valid? # run validations
      expect(record.errors[:body]).not_to include("can't be blank")
    end
  end
end
