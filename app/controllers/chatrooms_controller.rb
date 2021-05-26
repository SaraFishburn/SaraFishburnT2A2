class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(chatroom_params[:id])
    @other_user = @chatroom.other_user(current_user)
  end

  def create
    user1 = User.where(id: chatroom_params[:user1].to_i)
    user2 = User.where(id: chatroom_params[:user1].to_i)

    return if user1 == user2

    @chatroom = Chatroom.chatroom_with_users(user1, user2)
    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.permit(:id, :user1, :user2)
  end
end
