class AddKindToCharacterSheet < ActiveRecord::Migration[7.2]
  def change
    add_column :character_sheets, :kind, :integer, null: false, default: 0
  end
end
