class Mission < ApplicationRecord
  belongs_to :game_master, class_name: "User"
end
