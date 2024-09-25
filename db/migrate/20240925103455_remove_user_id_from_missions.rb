class RemoveUserIdFromMissions < ActiveRecord::Migration[7.2]
  def change
    remove_column :missions, :user_id, :integer
  end
end
