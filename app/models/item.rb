class Item < ApplicationRecord
  has_many :inventories
  has_many :character_sheets, through: :inventories

  enum durability: { pristine: 0, good: 1, fair: 2, worn: 3, damaged: 4, ruined: 5 }
  enum rarity: { common: 0, uncommon: 1, rare: 2, epic: 3, legendary: 4 }

  self.inheritance_column = :type
end
