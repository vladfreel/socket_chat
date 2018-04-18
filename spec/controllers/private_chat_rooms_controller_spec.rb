require 'rails_helper'
RSpec.describe PrivateChatRoomsController, type: :controller do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    sign_in @user1
  end
  describe 'CREATE' do
    it 'create chat_room(CREATE)' do
      expect do
        post :create,
             params: { private_chat_room: attributes_for(:private_chat_room,
                                                         membership_attributes:{owner_id: @user1.id,
                                                                                member_id: @user2.id}) }
      end.to change { PrivateChatRoom.count }.by(1) and change { Membership.count }.by(1) and
          redirect_to PrivateChatRoom.last && have_http_status(200)
    end
  end

  describe 'INDEX' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end

  describe 'SHOW' do
    it 'assigns the requested category to @category' do
      private_chat_room = create(:private_chat_room)
      get :show, params: { id: private_chat_room.id }
      expect(assigns(:private_chat_room)).to eq(private_chat_room)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

end
