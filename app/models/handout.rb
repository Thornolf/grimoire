class Handout < ApplicationRecord
  belongs_to :mission, optional: true
  has_rich_text :content
  has_one_attached :file
end
