class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.integer :weight
      t.integer :value
      t.integer :durability, default: 0, null: false # Enum for durability (pristine to destroyed)
      t.integer :rarity, default: 0, null: false     # Enum for rarity (common to legendary)
      t.text :effect # Optional field for item effect

      t.timestamps
    end
  end
end
