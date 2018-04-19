require 'rails_helper'
RSpec.describe 'Chat room management', type: :request do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    sign_in @user1
  end
  it 'creates a Chat room and redirects to the Chat room page' do
    get '/chat_rooms/new'
    expect(response).to render_template(:new)
    post '/private_chat_rooms', params: { private_chat_room:{name: 'gsdgs', membership_attributes:{owner_id: @user1.id,
                                                                            member_id: @user2.id}} }
    expect(response).to redirect_to PrivateChatRoom.last
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.body).to include(PrivateChatRoom.last.name)
  end

  it 'does not render a different template' do
    get '/chat_rooms/new'
    expect(response).to_not render_template(:show)
  end
end
