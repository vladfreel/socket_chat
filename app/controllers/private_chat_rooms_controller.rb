class PrivateChatRoomsController < ApplicationController

  def show
    #fill in soon
  end

  def index
    @rooms = current_user.rooms
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @room.users << current_user
      redirect_to room_memberships_path(@room)
    else
      flash[:error] = @room.errors.full_messages.to_sentence
      redirect_to rooms_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
