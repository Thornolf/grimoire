class CreateMissionsUsersJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_table :missions_users do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role, null: false, default: 0

      t.timestamps
    end

    add_index :missions_users, [ :mission_id, :user_id ], unique: true
  end
end
