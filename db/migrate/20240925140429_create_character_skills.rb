class CreateCharacterSkills < ActiveRecord::Migration[7.2]
  def change
    create_table :character_skills do |t|
      t.references :character_sheet, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :custom_percentage
      t.boolean :used

      t.timestamps
    end
  end
end
