class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :latitude, :numeric
    add_column :users, :longitude, :numeric
    add_column :users, :address, :string
    add_column :users, :suburb_and_postcode, :string
    add_column :users, :rating, :integer
  end
end
