class GameShip < ApplicationRecord
  belongs_to :game
  belongs_to :player
  has_many :ships
  has_many :game_ship_coordinates
  has_many :coordinates, through: :game_ship_coordinates
end
