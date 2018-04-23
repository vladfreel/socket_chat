class MultiUserPrivateChatRoomsController < ApplicationController

  def new
    @multi_user_private_chat_room = MultiUserPrivateChatRoom.new
  end

  def create
    @multi_user_private_chat_room = MultiUserPrivateChatRoom.new(multi_user_chat_room_params)
    if @multi_user_private_chat_room.save!
      flash[:success] = 'Chat room added!'
      redirect_to @multi_user_private_chat_room
    else
      render 'new'
    end
  end

  def edit

  end

  def index
    @rooms = MultiUserMembership.where(user_id: current_user.id)
    @rooms_owner = MultiUserPrivateChatRoom.where(user_id: current_user.id)
  end

  def show
    @multi_chat_room = MultiUserPrivateChatRoom.includes(:multi_user_messages).find_by(id: params[:id])
    @message = MultiUserMessage.new
    if params[:username].nil? || params[:username] == current_user.username
      @users = []
    else
      @users = User.search params[:username]
    end
    @chat_room = MultiUserPrivateChatRoom.find(params[:id])
    @membership = @chat_room.multi_user_memberships.build
  end


  private

  def multi_user_chat_room_params
    params.require(:multi_user_private_chat_room).permit(:name, :user_id)
  end
end
