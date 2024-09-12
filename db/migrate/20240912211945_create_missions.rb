class CreateMissions < ActiveRecord::Migration[7.2]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.references :game_master, null: false, foreign_key: true

      t.timestamps
    end
  end
end
