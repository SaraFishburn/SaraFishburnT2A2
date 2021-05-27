class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # render the html the message will be wrapped in for styling
    html = ApplicationController.render(partial: 'shared/message', locals: { message: message })

    # broadcast the message to the chatroom
    ActionCable.server.broadcast "chatroom_channel_#{message.chatroom_id}", html: html, message_user_id: message.user.id
  end
end
