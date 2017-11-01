steve = Player.create({username: "Steve", password_hash: "password"})
todd = Player.create({username: "Todd", password_hash: "password"})

gamely = Game.create({winner: todd, player1: steve, player2: todd})

carrier = Ship.create({length: 5})
battleship = Ship.create({length: 4})
submarine = Ship.create({length: 3})
cruiser = Ship.create({length: 3})
destroyer = Ship.create({length: 2})

# steve1destroyer = GameShip.create({game: gamely, player: steve, ship_id: 5})
# todd2battleship = GameShip.create({game: gamely, player: todd, ship_id: 2})

x_positions = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
y_positions = [1,2,3,4,5,6,7,8,9,10]

x=0
y=0
while x < x_positions.length
  Coordinate.create(x_position: x_positions[x], y_position: y_positions[y], is_hit: false )
  y+=1
    if y == 10
      y = 0
      x+=1
    end
end


# destroyercoord = GameShipCoordinate.create({coordinate: coordinate1, game_ship: steve1destroyer})
# battleshipcoord = GameShipCoordinate.create({coordinate: coordinate2, game_ship: todd2battleship})

