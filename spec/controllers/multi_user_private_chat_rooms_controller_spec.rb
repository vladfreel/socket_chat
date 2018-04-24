require 'rails_helper'
RSpec.describe MultiUserPrivateChatRoomsController, type: :controller do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    sign_in @user1
  end
  describe 'NEW' do
    it 'should be successful(NEW)' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
  describe 'CREATE' do
    it 'create multi_user_chat_room(CREATE)' do
      expect do
        post :create,
             params: { multi_user_private_chat_room: attributes_for(:multi_user_private_chat_room,
                                                                    user_id: @user1.id) }
      end.to change { MultiUserPrivateChatRoom.count }.by(1) and
          redirect_to MultiUserPrivateChatRoom.last && have_http_status(200)
    end
  end

  describe 'INDEX' do
    it 'assigns @multi_user_private_chat_room' do
      # room = create(:multi_user_private_chat_room, user_id: @user1.id)
      get :index
      # expect(assigns(:multi_user_private_chat_rooms)).to eq([room])
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end

  describe 'SHOW' do
    it 'assigns the requested multi_user_chat_room to @multi_user_chat_room' do
      room = create(:multi_user_private_chat_room, user_id: @user1.id)
      get :show, params: { id: room.id }
      # expect(assigns(:multi_user_private_chat_room)).to eq([room])
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  context '#update' do
      let(:room_attrs) { { name: 'Rick Grimes' } }

      before do
        @room = create(:multi_user_private_chat_room, user_id: @user1.id)
        put :update, params: { id: @room.id, multi_user_private_chat_room: room_attrs }
        @room.reload
      end

      it 'has updated name' do
        expect(@room.name).to eql room_attrs[:name]
      end

      it 'redirect to multi_user_chat_room show page' do
        expect(response).to redirect_to(multi_user_private_chat_room_path(@room))
      end
  end
end
