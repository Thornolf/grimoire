class AddUsernameAndRoleToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :username, :string
    add_column :users, :role, :integer, default: 0
  end
end
