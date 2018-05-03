module ApplicationHelper
  def no_header_page(controller_name, action_name)
    controller_name == 'private_chat_rooms' && action_name == 'show'
  end

  def no_footer_page(controller_name, action_name)
    controller_name == 'private_chat_rooms' && action_name == 'show'
  end
end
