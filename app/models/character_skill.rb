class CharacterSkill < ApplicationRecord
  belongs_to :character_sheet
  belongs_to :skill

  validates :custom_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
