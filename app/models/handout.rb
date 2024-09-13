class Handout < ApplicationRecord
  belongs_to :mission
  has_rich_text :content
end
