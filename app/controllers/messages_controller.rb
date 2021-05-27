class MessagesController < ApplicationController

  def create
    chatroom = Chatroom.find(params[:chatroom_id])

    # if user attempts to post an empty message or to a chatroom they aren't a member of, redirect to root_path
    return if message_params[:content].empty? || !chatroom&.users&.include?(current_user)

    @message = current_user.messages.create(message_params)

    # update the chatroom to keep track of most active chatrooms and assist with chatroom list ordering
    chatroom.update(updated_at: Time.now)

    # when a message is created, call on the send message job to broadcast the message to the chatroom
    SendMessageJob.perform_later(@message)
  end

  private

  def message_params
    params.permit(:content, :chatroom_id)
  end
end
