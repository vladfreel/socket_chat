require 'test_helper'

class MultiUserPrivateChatRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multi_user_private_chat_room = multi_user_private_chat_rooms(:one)
  end

  test "should get index" do
    get multi_user_private_chat_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_multi_user_private_chat_room_url
    assert_response :success
  end

  test "should create multi_user_private_chat_room" do
    assert_difference('MultiUserPrivateChatRoom.count') do
      post multi_user_private_chat_rooms_url, params: { multi_user_private_chat_room: {  } }
    end

    assert_redirected_to multi_user_private_chat_room_url(MultiUserPrivateChatRoom.last)
  end

  test "should show multi_user_private_chat_room" do
    get multi_user_private_chat_room_url(@multi_user_private_chat_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_multi_user_private_chat_room_url(@multi_user_private_chat_room)
    assert_response :success
  end

  test "should update multi_user_private_chat_room" do
    patch multi_user_private_chat_room_url(@multi_user_private_chat_room), params: { multi_user_private_chat_room: {  } }
    assert_redirected_to multi_user_private_chat_room_url(@multi_user_private_chat_room)
  end

  test "should destroy multi_user_private_chat_room" do
    assert_difference('MultiUserPrivateChatRoom.count', -1) do
      delete multi_user_private_chat_room_url(@multi_user_private_chat_room)
    end

    assert_redirected_to multi_user_private_chat_rooms_url
  end
end
