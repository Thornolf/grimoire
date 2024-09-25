class MissionsUser < ApplicationRecord
  belongs_to :mission
  belongs_to :user


  # TODO: module this
  enum :role, %i[player game_master]
end
