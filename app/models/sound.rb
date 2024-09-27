class Sound < ApplicationRecord
  has_one_attached :file

  has_many :mission_sounds
  has_many :missions, through: :mission_sounds
end
