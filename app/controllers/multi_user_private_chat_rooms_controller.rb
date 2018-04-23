class MultiUserPrivateChatRoomsController < ApplicationController
  before_action :find_room, only: [:edit, :show, :update]

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

  def update
    if @chat_room.update!(multi_user_chat_room_params)
      redirect_to @chat_room
    else
      render 'edit'
    end
  end

  def index
    @users = MultiUserMembership.where(user_id: current_user.id)
    @owner = MultiUserPrivateChatRoom.where(user_id: current_user.id)
  end

  def show
    @multi_chat_room = MultiUserPrivateChatRoom.includes(:multi_user_messages).find_by(id: params[:id])
    @message = MultiUserMessage.new
    if params[:username].nil? || params[:username] == current_user.username
      @find_users = []
    else
      @find_users = User.search params[:username]
    end
    @membership = @chat_room.multi_user_memberships.build
  end


  private

  def find_room
    @chat_room = MultiUserPrivateChatRoom.find(params[:id])
    @users = MultiUserMembership.where(multi_user_private_chat_room_id: @chat_room.id)
  end

  def multi_user_chat_room_params
    params.require(:multi_user_private_chat_room).permit(:name, :user_id)
  end
end
