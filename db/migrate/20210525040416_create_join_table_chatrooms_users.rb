class CreateJoinTableChatroomsUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :chatrooms, :users do |t|
      t.index [:user_id, :chatroom_id]
      # t.index [:chatroom_id, :user_id]
    end
  end
end
