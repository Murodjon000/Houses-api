class AddUserRefToHouses < ActiveRecord::Migration[6.1]
  def change
    add_reference :houses, :user, null: false, foreign_key: true
  end
end
