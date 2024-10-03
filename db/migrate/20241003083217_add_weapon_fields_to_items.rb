class AddWeaponFieldsToItems < ActiveRecord::Migration[7.2]
   def change
    add_column :items, :type, :string
    add_column :items, :skill_percentage, :integer
    add_column :items, :base_range, :integer
    add_column :items, :damage, :string
    add_column :items, :armor_piercing, :integer
    add_column :items, :lethality_percentage, :integer
    add_column :items, :kill_radius, :integer
    add_column :items, :ammo, :integer
  end
end
