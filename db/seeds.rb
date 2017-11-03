# steve = Player.create({username: "Steve", password_hash: "password"})
# todd = Player.create({username: "Todd", password_hash: "password"})

# gamely = Game.create({winner: steve, player1: steve, player2: todd, turn_id: steve.id})

carrier = Ship.create({name: "Carrier", length: 5})
battleship = Ship.create({name: "Battleship", length: 4})
submarine = Ship.create({name: "Submarine", length: 3})
cruiser = Ship.create({name: "Cruiser", length: 3})
destroyer = Ship.create({name: "Destroyer", length: 2})

# steve1destroyer = GameShip.create({game: gamely, player: steve, ship_id: 5})
# todd2battleship = GameShip.create({game: gamely, player: todd, ship_id: 2})

x_positions = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
y_positions = [1,2,3,4,5,6,7,8,9,10]

x=0
y=0
while y < x_positions.length
  Coordinate.create(x_position: x_positions[x], y_position: y_positions[y])
  x+=1
    if x == 10
      x = 0
      y+=1
    end
end


# destroyercoord1 = GameShipCoordinate.create({coordinate_id: 10, game_ship: steve1destroyer})
# destroyercoord2 = GameShipCoordinate.create({coordinate_id: 10, game_ship: steve1destroyer})

# battleshipcoord1 = GameShipCoordinate.create({coordinate_id: 17, game_ship: todd2battleship})
# battleshipcoord2 = GameShipCoordinate.create({coordinate_id: 27, game_ship: todd2battleship})
# battleshipcoord3 = GameShipCoordinate.create({coordinate_id: 37, game_ship: todd2battleship})
# battleshipcoord4 = GameShipCoordinate.create({coordinate_id: 47, game_ship: todd2battleship})

