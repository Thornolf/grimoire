class Mission < ApplicationRecord
  belongs_to :user
  has_many :character_sheets
end
