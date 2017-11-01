class Player < ApplicationRecord
  has_many :player1_games, class_name: "Game", foreign_key: "player1_id"
  has_many :player2_games, class_name: "Game", foreign_key: "player2_id"
  has_many :won_games, class_name: "Game", foreign_key: "winner_id"
  has_many :game_ships, through: :games
end
