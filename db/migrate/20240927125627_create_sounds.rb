class CreateSounds < ActiveRecord::Migration[7.2]
  def change
    create_table :sounds do |t|
      t.string :title

      t.timestamps
    end
  end
end
