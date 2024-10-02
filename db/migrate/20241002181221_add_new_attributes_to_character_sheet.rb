class AddNewAttributesToCharacterSheet < ActiveRecord::Migration[7.2]
  def change
    add_column :character_sheets, :employer, :string
    add_column :character_sheets, :gender, :string
    add_column :character_sheets, :age, :integer
    add_column :character_sheets, :nationality, :string
    add_column :character_sheets, :motivation, :text
    add_column :character_sheets, :profession, :string
    add_column :character_sheets, :rank, :string
    add_column :character_sheets, :occupation_history, :string
  end
end
