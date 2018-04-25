class MultiUserPrivateChatRoomPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    return true if user.present? && user == multi_user_private_chat_room.user
  end

  def update?
    return true if user.present? && user == multi_user_private_chat_room.user
  end

  def index?
    user.present?
  end

  def show?
    return true if user.present? && user == multi_user_private_chat_room.users.find_by(id: user.id)
  end

  private

  def multi_user_private_chat_room
    record
  end
end