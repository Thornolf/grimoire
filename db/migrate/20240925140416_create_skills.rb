class CreateSkills < ActiveRecord::Migration[7.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :base_percentage
      t.string :category
      t.boolean :default, default: false, null: false

      t.timestamps
    end
  end
end
