require 'rails_helper'
RSpec.describe 'Chat room management', type: :request do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end
  it 'creates a Chat room and redirects to the Chat room page' do
    get '/chat_rooms/new'
    expect(response).to render_template(:new)
    post '/chat_rooms', params: { chat_room: { title: 'My Category',
                                              user_id: @user.id } }
    expect(response).to redirect_to(assigns(:chat_room))
    follow_redirect!
    expect(response).to render_template(:show)
    expect(response.body).to include(ChatRoom.last.title)
  end

  it 'does not render a different template' do
    get '/chat_rooms/new'
    expect(response).to_not render_template(:show)
  end
end
