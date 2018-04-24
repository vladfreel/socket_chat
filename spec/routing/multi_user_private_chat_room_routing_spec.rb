require 'rails_helper'
RSpec.describe 'routes for Chat room', type: :routing do
  it do
    expect(get: '/multi_user_private_chat_rooms').to route_to(controller: 'multi_user_private_chat_rooms',
                                                              action: 'index')
  end
  it do
    expect(get: '/multi_user_private_chat_rooms/1').to route_to(controller: 'multi_user_private_chat_rooms',
                                                                action: 'show',
                                                                id: '1')
  end
  it do
    expect(get: '/multi_user_private_chat_rooms/new').to route_to(controller: 'multi_user_private_chat_rooms',
                                                                  action: 'new')
  end
  it do
    expect(post: '/multi_user_private_chat_rooms').to route_to(controller: 'multi_user_private_chat_rooms',
                                                               action: 'create')
  end
  it do
    expect(get: '/multi_user_private_chat_rooms/1/edit').to route_to(controller: 'multi_user_private_chat_rooms',
                                                                action: 'edit',
                                                                id: '1')
  end

end
