class CreateCharacterSheetsConditions < ActiveRecord::Migration[7.2]
  def change
    create_table :character_sheets_conditions do |t|
      t.references :character_sheet, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :severity

      t.timestamps
    end
  end
end
