require 'rails_helper'
RSpec.describe 'Chat room management', type: :request do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    sign_in @user1
  end
  it 'creates a Chat room and redirects to the Chat room page' do
    get '/multi_user_private_chat_rooms/new'
    expect(response).to render_template(:new)
    post '/multi_user_private_chat_rooms',
         params: { multi_user_private_chat_room: attributes_for(:multi_user_private_chat_room,
                                                                user_id: @user1.id) }
    expect(response).to redirect_to MultiUserPrivateChatRoom.last
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.body).to include(MultiUserPrivateChatRoom.last.name)
  end

  it 'does not render a different template' do
    get '/multi_user_private_chat_rooms/new'
    expect(response).to_not render_template(:show)
  end
end
