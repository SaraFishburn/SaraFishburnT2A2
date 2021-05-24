class CreateFilaments < ActiveRecord::Migration[6.1]
  def change
    create_table :filaments do |t|
      t.timestamps
      t.string :filament_brand
      t.string :filament_color
      t.string :filament_type, null: false
      t.string :filament_special_characteristic
    end
  end
end
