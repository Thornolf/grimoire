class Handout < ApplicationRecord
  belongs_to :mission
  has_rich_text :content
  has_one_attached :file
end
