class CreateJoinTableUserFilament < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :filaments do |t|
      t.index %i[user_id filament_id]
      # t.index [:filament_id, :user_id]
    end
  end
end
