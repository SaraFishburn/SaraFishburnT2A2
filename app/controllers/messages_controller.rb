class MessagesController < ApplicationController

  def show
    chatroom = Chatroom.find(params[:chatroom_id])
    return redirect_to root_path unless chatroom&.users&.include?(current_user)
  end

  def new
    @message = Message.new
  end

  def create
    chatroom = Chatroom.find(params[:chatroom_id])
    return if message_params[:content].empty? || !chatroom.users.include?(current_user)

    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    chatroom.update(updated_at: Time.now)

    SendMessageJob.perform_later(@message)
  end

  def update
    # placeholder
  end

  private

  def message_params
    params.permit(:content, :chatroom_id)
  end
end
