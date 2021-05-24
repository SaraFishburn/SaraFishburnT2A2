class CreatePrinters < ActiveRecord::Migration[6.1]
  def change
    create_table :printers do |t|
      t.timestamps
      t.string :printer_brand
      t.string :printer_model
      t.string :printer_type, null: false
    end
  end
end
