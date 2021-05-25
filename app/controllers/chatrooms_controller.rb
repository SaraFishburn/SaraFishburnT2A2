class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @other_user = @chatroom.other_user(current_user)
  end
end
