require 'rails_helper'
RSpec.describe ChatRoomsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end
  describe 'NEW' do
    it 'should be successful(NEW)' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'CREATE' do
    it 'create chat_room(CREATE)' do
      expect do
        post :create,
             params: { chat_room: attributes_for(:chat_room,
                                                user_id: @user) }
      end.to change { ChatRoom.count }.by(1) and
          redirect_to ChatRoom.last && have_http_status(200)
    end
  end

  describe 'INDEX' do
    it 'assigns @categories' do
      chat_room = create(:chat_room, user_id: @user.id)
      get :index
      expect(assigns(:chat_rooms)).to eq([chat_room])
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end

  describe 'SHOW' do
    it 'assigns the requested category to @category' do
      chat_room = create(:chat_room, user_id: @user.id)
      get :show, params: { id: chat_room.id }
      expect(assigns(:chat_room)).to eq(chat_room)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

end
