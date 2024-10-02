class AddBackgroundToCharacterSheet < ActiveRecord::Migration[7.2]
  def change
    add_column :character_sheets, :background, :text
  end
end
