class GameShip < ApplicationRecord
  belongs_to :game
  belongs_to :player
  has_many :ships
  has_many :game_ship_coordinates
  has_many :coordinates, through: :game_ship_coordinates
end

#Game.first.game_ships.find_by(player_id: 1).coordinates

#Game.first.game_ships.find_by(player_id: 1).game_ship_coordinates
