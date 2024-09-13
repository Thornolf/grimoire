class AddUserIdToCharacterSheets < ActiveRecord::Migration[7.2]
  def change
    add_column :character_sheets, :user_id, :integer
    add_index :character_sheets, :user_id
  end
end
