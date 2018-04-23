class MultiUserMembershipsController < ApplicationController
  #
  def create
    membership = MultiUserMembership.new(multi_user_membership_params)
    if membership.save
      flash[:success] = 'Chat room added!'
      redirect_to multi_user_private_chat_room_path(membership.multi_user_private_chat_room.id)
    else
      redirect_to multi_user_private_chat_room_path(membership.multi_user_private_chat_room.id)
    end
  end

  def destroy
    membership = MultiUserMembership.find(params[:id])
    membership.destroy
    redirect_to multi_user_private_chat_room_path(membership.multi_user_private_chat_room.id)
  end
  private

  def multi_user_membership_params
    params.require(:multi_user_membership).permit(:multi_user_private_chat_room_id, :user_id)
  end
end
