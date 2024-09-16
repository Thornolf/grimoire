class ChangeMissionIdInHandoutsToNullable < ActiveRecord::Migration[7.2]
  def change
    change_column_null :handouts, :mission_id, true
  end
end
