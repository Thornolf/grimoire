class CreateInventories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventories do |t|
      t.references :character_sheet, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :location

      t.timestamps
    end
  end
end
