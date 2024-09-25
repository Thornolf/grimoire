class ChangeMissionIdNullInCharacterSheets < ActiveRecord::Migration[7.2]
  def change
    change_column_null :character_sheets, :mission_id, true
  end
end
