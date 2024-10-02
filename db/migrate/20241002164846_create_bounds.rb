class CreateBounds < ActiveRecord::Migration[7.2]
  def change
    create_table :bounds do |t|
      t.string :name
      t.text :description
      t.integer :score
      t.references :character_sheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
