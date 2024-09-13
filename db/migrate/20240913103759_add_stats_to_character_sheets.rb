class AddStatsToCharacterSheets < ActiveRecord::Migration[7.2]
  def change
    add_column :character_sheets, :strength, :integer
    add_column :character_sheets, :constitution, :integer
    add_column :character_sheets, :dexterity, :integer
    add_column :character_sheets, :intelligence, :integer
    add_column :character_sheets, :power, :integer
    add_column :character_sheets, :charisma, :integer
    add_column :character_sheets, :hit_points, :integer
    add_column :character_sheets, :willpower_points, :integer
    add_column :character_sheets, :sanity, :integer
    add_column :character_sheets, :breaking_point, :integer
    add_column :character_sheets, :luck, :integer
  end
end
