class AddRecentHistoryToCharacterSheet < ActiveRecord::Migration[7.2]
  def change
    add_column :character_sheets, :recent_history, :text
  end
end
