class MissionSound < ApplicationRecord
  belongs_to :mission
  belongs_to :sound
end
