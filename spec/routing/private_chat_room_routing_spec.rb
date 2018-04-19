require 'rails_helper'
RSpec.describe 'routes for Chat room', type: :routing do
  it do
    expect(get: '/private_chat_rooms').to route_to(controller: 'private_chat_rooms',
                                           action: 'index')
  end
  it do
    expect(get: '/private_chat_rooms/1').to route_to(controller: 'private_chat_rooms',
                                             action: 'show',
                                             id: '1')
  end
  it do
    expect(get: '/private_chat_rooms/new').to route_to(controller: 'private_chat_rooms',
                                               action: 'new')
  end
  it do
    expect(post: '/private_chat_rooms').to route_to(controller: 'private_chat_rooms',
                                            action: 'create')
  end
  it do
    expect(get: '/search').to route_to(controller: 'private_chat_rooms',
                                                    action: 'search')
  end

end
