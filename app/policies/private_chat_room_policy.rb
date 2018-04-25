class PrivateChatRoomPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def show?
    return true if user.present? && user == private_chat_room.owner || user == private_chat_room.member
  end

  def search?
    user.present?
  end

  private

  def private_chat_room
    record
  end
end