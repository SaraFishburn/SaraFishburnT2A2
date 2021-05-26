class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(chatroom_params[:id])
    @chatrooms = current_user.chatrooms.order(updated_at: :desc)
    @other_user = @chatroom.other_user(current_user)
  end

  def create
    user1 = User.find(chatroom_params[:user1])
    user2 = User.find(chatroom_params[:user2])

    return if user1 == user2

    @chatroom = Chatroom.chatroom_with_users(user1, user2)

    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.permit(:id, :user1, :user2)
  end
end
