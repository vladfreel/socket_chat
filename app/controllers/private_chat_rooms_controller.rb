class PrivateChatRoomsController < ApplicationController

  def show
    @private_chat_room = PrivateChatRoom.includes(:private_messages).find(params[:id])
    @message = PrivateMessage.new
  end

  def index
    @rooms = Membership.where(owner_id: current_user.id).or(Membership.where(member_id: current_user.id))
  end

  def create
    check_owner = PrivateChatRoom.check_owner_private_chat(params[:private_chat_room][:membership_attributes][:owner_id],
                                                 params[:private_chat_room][:membership_attributes][:member_id])
    check_member = PrivateChatRoom.check_member_private_chat(params[:private_chat_room][:membership_attributes][:owner_id],
                                                   params[:private_chat_room][:membership_attributes][:member_id])
    if check_owner.nil? && check_member.nil?
      @room = PrivateChatRoom.new(private_chat_room_params)
      if @room.save
        redirect_to private_chat_room_path(@room)
      else
        flash[:error] = @room.errors.full_messages.to_sentence
        redirect_to private_chat_rooms_path
      end
    else
      if check_owner.nil?
        redirect_to private_chat_room_path(check_member.private_chat_room.id)
      else
        redirect_to private_chat_room_path(check_owner.private_chat_room.id)
      end
    end
  end

  def search
    if params[:username].nil? || params[:username] == current_user.username
      @users = []
    else
      @users = User.search params[:username]
    end
    @room = PrivateChatRoom.new
    @room.build_membership
  end

  private

  def private_chat_room_params
    params.require(:private_chat_room).permit(:name, membership_attributes: [:owner_id, :member_id])
  end

end
