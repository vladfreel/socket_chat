class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
    # authorize @chat_rooms
  end

  def new
    @chat_room = ChatRoom.new
    authorize @chat_room
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    authorize @chat_room
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to @chat_room
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    authorize @chat_room
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end