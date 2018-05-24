class PrivateChatRoomsController < ApplicationController

  def show
    @private_chat_room = PrivateChatRoom.includes(:private_messages).find(params[:id])
    @message = PrivateMessage.new
    authorize @private_chat_room
  end

  def index
    @rooms = Membership.where(owner_id: current_user.id).or(Membership.where(member_id: current_user.id))
  end

  def create
    check = PrivateChatRoom.check_private_chat(params[:private_chat_room][:membership_attributes][:owner_id],
                                               params[:private_chat_room][:membership_attributes][:member_id])
    if check.nil?
      @room = PrivateChatRoom.new(private_chat_room_params)
      authorize @room
      if @room.save
        redirect_to private_chat_room_path(@room)
      else
        flash[:error] = @room.errors.full_messages.to_sentence
        redirect_to private_chat_rooms_path
      end
    else
      redirect_to private_chat_room_path(check.private_chat_room.id)
    end
  end

  private

  def private_chat_room_params
    params.require(:private_chat_room).permit(:name, membership_attributes: %i[owner_idmember_id])
  end
end
