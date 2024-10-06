class AddForeignKeyToBounds < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :bounds, :character_sheets
  end
end
