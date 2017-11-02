class Player < ApplicationRecord
  has_many :player1_games, class_name: "Game", foreign_key: "player1_id"
  has_many :player2_games, class_name: "Game", foreign_key: "player2_id"
  has_many :won_games, class_name: "Game", foreign_key: "winner_id"
  has_many :current_turns, class_name: "Game", foreign_key: "turn_id"
  has_many :game_ships, through: :games


  validates :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username)
    # if email corresponds to a valid user, return that user
    Player.find_by(username: username)
  end

end



