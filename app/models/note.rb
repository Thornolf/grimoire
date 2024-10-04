class Note < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  has_rich_text :content
end
