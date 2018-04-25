class ChatRoomPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def show?
    user.present?
  end

  def new?
    user.present?
  end

  private

  def chat_room
    record
  end
end