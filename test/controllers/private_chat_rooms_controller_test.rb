require 'test_helper'

class PrivateChatRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @private_chat_room = private_chat_rooms(:one)
  end

  test "should get index" do
    get private_chat_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_private_chat_room_url
    assert_response :success
  end

  test "should create private_chat_room" do
    assert_difference('PrivateChatRoom.count') do
      post private_chat_rooms_url, params: { private_chat_room: {  } }
    end

    assert_redirected_to private_chat_room_url(PrivateChatRoom.last)
  end

  test "should show private_chat_room" do
    get private_chat_room_url(@private_chat_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_private_chat_room_url(@private_chat_room)
    assert_response :success
  end

  test "should update private_chat_room" do
    patch private_chat_room_url(@private_chat_room), params: { private_chat_room: {  } }
    assert_redirected_to private_chat_room_url(@private_chat_room)
  end

  test "should destroy private_chat_room" do
    assert_difference('PrivateChatRoom.count', -1) do
      delete private_chat_room_url(@private_chat_room)
    end

    assert_redirected_to private_chat_rooms_url
  end
end
