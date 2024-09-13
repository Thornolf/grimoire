class ReplaceGameMasterIdWithUserIdInMissions < ActiveRecord::Migration[7.2]
   def change
    remove_column :missions, :game_master_id, :integer
    add_reference :missions, :user, foreign_key: true
  end
end
