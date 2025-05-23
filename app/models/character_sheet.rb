class CharacterSheet < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :mission, optional: true

  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories

  has_many :character_skills, dependent: :destroy
  has_many :skills, through: :character_skills

  has_many :character_sheets_conditions, dependent: :destroy
  has_many :conditions, through: :character_sheets_conditions

  has_many :bounds, dependent: :destroy
  accepts_nested_attributes_for :bounds, allow_destroy: true

  before_create :calculate_secondary_stats

  validates :strength, :constitution, :dexterity, :intelligence, :power, :charisma,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 18 }
  validate :primary_stats_total_points

  enum :kind, %i[player npc]

  private

  def primary_stats_total_points
    total = strength + constitution + dexterity + intelligence + power + charisma
    if total > 72
      errors.add(:base, "Total points spent on primary stats cannot exceed 72")
    end
  end

  # Method to calculate secondary stats before save
  def calculate_secondary_stats
    self.hit_points = ((self.constitution + self.strength) / 2).round
    self.willpower_points = self.power
    self.sanity = self.power * 5
    self.breaking_point = self.sanity - self.power
    self.luck = generate_luck
  end

  # Method to generate luck
  def generate_luck
    rand(3..18) * 5
  end
end
