class AddDescriptionToSound < ActiveRecord::Migration[7.2]
  def change
    add_column :sounds, :description, :string
  end
end
