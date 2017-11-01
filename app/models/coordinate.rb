class Coordinate < ApplicationRecord
  has_many :game_ship_coordinate
  has_many :game_ships, through: :game_ship_coordinates
  #has_many :ships
end
