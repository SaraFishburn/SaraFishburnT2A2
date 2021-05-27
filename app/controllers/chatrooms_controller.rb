class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(chatroom_params[:id])

    # if the user is not a member of the chatroom they are trying to access, redirect them to the root_path
    redirect_to root_path unless @chatroom&.users&.include?(current_user)

    # order the list of user's chatrooms by when the chatrooms were last updated
    @chatrooms = current_user.chatrooms.order(updated_at: :desc)

    # identify the other member attached to the chatroom using a custom function in the chatroom model
    @other_user = @chatroom.other_user(current_user)
  end

  def create
    # find users to be added to a chatroom give the user id's
    user1 = User.find(chatroom_params[:user1])
    user2 = User.find(chatroom_params[:user2])

    # when creating a room, if both members are the same, don't create (users can not make a chatroom with themselves)
    return if user1 == user2

    # create a chatroom with the identified users via a custom function in the chatroom model
    @chatroom = Chatroom.chatroom_with_users(user1, user2)

    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.permit(:id, :user1, :user2)
  end
end
