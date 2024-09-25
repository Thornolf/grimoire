class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, %i[player game_master]

  has_many :missions_users
  has_many :missions, through: :missions_users

  has_many :character_sheets
end
