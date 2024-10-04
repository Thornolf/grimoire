class CreateConditions < ActiveRecord::Migration[7.2]
  def change
    create_table :conditions do |t|
      t.string :name
      t.text :description
      t.integer :severity
      t.integer :condition_type

      t.timestamps
    end
  end
end
