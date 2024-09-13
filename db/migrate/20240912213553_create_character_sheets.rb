class CreateCharacterSheets < ActiveRecord::Migration[7.2]
  def change
    create_table :character_sheets do |t|
      t.string :name
      t.references :mission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
