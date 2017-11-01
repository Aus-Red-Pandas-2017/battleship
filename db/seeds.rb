steve = Player.create({username: "Steve", password_hash: "password"})
todd = Player.create({username: "Todd", password_hash: "password"})

gamely = Game.create({winner: todd, player1: steve, player2: todd})

carrier = Ship.create({length: 5})
battleship = Ship.create({length: 4})
submarine = Ship.create({length: 3})
cruiser = Ship.create({length: 3})
destroyer = Ship.create({length: 2})

steve1destroyer = GameShip.create({game: gamely, player: steve, ship_id: 5})
todd2battleship = GameShip.create({game: gamely, player: todd, ship_id: 2})


coordinate1 = Coordinate.create({x_position: "A", y_position: 2, is_hit: false})

coordinate2 = Coordinate.create({x_position: "B", y_position: 4, is_hit: false})

destroyercoord = GameShipCoordinate.create({coordinate: coordinate1, game_ship: steve1destroyer})
battleshipcoord = GameShipCoordinate.create({coordinate: coordinate2, game_ship: todd2battleship})

