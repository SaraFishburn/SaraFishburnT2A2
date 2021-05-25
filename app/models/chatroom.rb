class Chatroom < ApplicationRecord
  has_many :messages

  has_and_belongs_to_many :users

  def other_user(current_user)
    (users - [current_user]).first
  end
end
