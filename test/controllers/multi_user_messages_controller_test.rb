require 'test_helper'

class MultiUserMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multi_user_message = multi_user_messages(:one)
  end

  test "should get index" do
    get multi_user_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_multi_user_message_url
    assert_response :success
  end

  test "should create multi_user_message" do
    assert_difference('MultiUserMessage.count') do
      post multi_user_messages_url, params: { multi_user_message: {  } }
    end

    assert_redirected_to multi_user_message_url(MultiUserMessage.last)
  end

  test "should show multi_user_message" do
    get multi_user_message_url(@multi_user_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_multi_user_message_url(@multi_user_message)
    assert_response :success
  end

  test "should update multi_user_message" do
    patch multi_user_message_url(@multi_user_message), params: { multi_user_message: {  } }
    assert_redirected_to multi_user_message_url(@multi_user_message)
  end

  test "should destroy multi_user_message" do
    assert_difference('MultiUserMessage.count', -1) do
      delete multi_user_message_url(@multi_user_message)
    end

    assert_redirected_to multi_user_messages_url
  end
end
