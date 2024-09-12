class CreateHandouts < ActiveRecord::Migration[7.2]
  def change
    create_table :handouts do |t|
      t.string :title
      t.text :content
      t.references :mission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
