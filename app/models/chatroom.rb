class Chatroom < ApplicationRecord
  has_many :messages

  has_and_belongs_to_many :users

  def other_user(current_user)
    (users - [current_user]).first
  end

  def self.chatroom_with_users(user1, user2)
    existing_chatroom = user1.chatrooms.joins(:users).where(users: user2).first
    return existing_chatroom if existing_chatroom

    chatroom = create
    chatroom.users << user1
    chatroom.users << user2
    chatroom.save
  end
end
