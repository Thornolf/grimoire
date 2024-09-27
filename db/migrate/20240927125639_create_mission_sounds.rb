class CreateMissionSounds < ActiveRecord::Migration[7.2]
  def change
    create_table :mission_sounds do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :sound, null: false, foreign_key: true

      t.timestamps
    end
  end
end
