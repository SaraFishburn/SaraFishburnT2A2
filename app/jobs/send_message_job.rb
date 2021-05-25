class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = ApplicationController.render(partial: 'shared/message', locals: { message: message })

    ActionCable.server.broadcast "chatroom_channel_#{message.chatroom_id}", html: html, message_user_id: message.user.id
  end
end
