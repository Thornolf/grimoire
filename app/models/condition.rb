class Condition < ApplicationRecord
  has_many :character_sheets_conditions
  has_many :character_sheets, through: :character_sheets_conditions

  enum condition_type: { mental_disorder: 0, wound: 1, ailment: 2 }  # You can add more types if needed
end
