class CreateJoinTableUserPrinter < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :printers do |t|
      t.index [:user_id, :printer_id]
      # t.index [:printer_id, :user_id]
    end
  end
end
