class AddDefaultLocationToInventories < ActiveRecord::Migration[7.2]
  def change
    change_column_default :inventories, :location, from: nil, to: 1
  end
end
