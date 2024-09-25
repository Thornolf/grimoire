class Skill < ApplicationRecord
  has_many :character_skills
  has_many :character_sheets, through: :character_skills
end
