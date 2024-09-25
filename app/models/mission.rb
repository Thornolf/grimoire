class Mission < ApplicationRecord
  # A mission belongs to one game master
  has_one :game_master_association, -> { where(role: "game_master") }, class_name: "MissionsUser"
  has_one :game_master, through: :game_master_association, source: :user

  # A mission can have many players
  has_many :player_associations, -> { where(role: "player") }, class_name: "MissionsUser"
  has_many :players, through: :player_associations, source: :user

  has_many :character_sheets
  has_many :handouts
end
