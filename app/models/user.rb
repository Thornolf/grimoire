class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, %i[player game_master]

  has_many :missions_users
  has_many :missions, through: :missions_users
  has_many :character_sheets
  has_many :notes, dependent: :destroy

  has_one_attached :profile_picture

  def display_profile_picture
    if profile_picture.attached?
      profile_picture
    elsif game_master?
      ActionController::Base.helpers.asset_path("game_master_default.png")
    else
      ActionController::Base.helpers.asset_path("player_default.png")
    end
  end
end
