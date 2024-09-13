class Mission < ApplicationRecord
  belongs_to :user
  has_many :character_sheets
  has_many :handouts, dependent: :destroy
end
