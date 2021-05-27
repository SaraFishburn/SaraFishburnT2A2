class Chatroom < ApplicationRecord
  # ensure record is deleted if users are deleted (porevent orphan record)
  has_many :messages, dependent: :destroy

  has_and_belongs_to_many :users

  # find the other user in the chatroom that isnt the current user
  def other_user(current_user)
    (users - [current_user]).first
  end

  # method to create a chatroom record given the 2 users that will be chatting in it
  def self.chatroom_with_users(user1, user2)
    # return the existing chatroom if the two users already have one
    existing_chatroom = user1.chatrooms.joins(:users).where(users: user2).first
    return existing_chatroom if existing_chatroom

    # create the room, add the users, save, and return
    chatroom = create
    chatroom.users << [user1, user2]
    chatroom.save
    chatroom
  end
end
