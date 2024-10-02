class RemoveUniqueIndexFromMissionsUsers < ActiveRecord::Migration[7.2]
  def change
    remove_index :missions_users, name: "index_missions_users_on_mission_id_and_user_id"
  end
end
