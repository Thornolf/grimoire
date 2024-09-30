class Inventory < ApplicationRecord
  belongs_to :character_sheet
  belongs_to :item

  enum location: { body: 0, backpack: 1, car: 2, safehouse: 3, other: 4 }
end
