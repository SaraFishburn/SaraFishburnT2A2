class MessagesController < ApplicationController

  def show
    # placeholder
  end

  def new
    @message = Message.new
  end

  def create
    return if message_params[:content].empty?

    @message = Message.new(message_params)
    @message.user = current_user
    @message.save

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
