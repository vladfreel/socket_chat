require 'rails_helper'
RSpec.describe MultiUserMembershipsController, type: :controller do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @room = create(:multi_user_private_chat_room, user_id: @user1.id)
    sign_in @user1
  end

  describe 'CREATE' do
    it 'create multi_user_chat_room(CREATE)' do
      expect do
        post :create,
             params: { multi_user_membership: attributes_for(:multi_user_private_chat_room,
                                                             user_id: @user1.id,
                                                             multi_user_private_chat_room_id: @room.id ) }
      end.to change { MultiUserMembership.count }.by(1) and
          redirect_to MultiUserPrivateChatRoom.last && have_http_status(200)
    end
  end

  describe 'DELETE membership' do
    it 'deletes the membership' do
      membership = create(:multi_user_membership,
                          multi_user_private_chat_room_id: @room.id,
                          user_id: @user1.id)
      expect do
        delete :destroy, params: { id: membership.id }
      end.to change(MultiUserMembership, :count).by(-1)
      expect(response).to have_http_status(302)
    end

    it 'redirects to multi_user_chat_room#show' do
      membership = create(:multi_user_membership,
                          multi_user_private_chat_room_id: @room.id,
                          user_id: @user1.id)
      delete :destroy, params: { id: membership }
      expect(response).to redirect_to multi_user_private_chat_room_path(@room.id)
      expect(response).to have_http_status(302)
    end
  end

end
