class GamesController < ApplicationController

  def index
  end

  def show
    @player_ships = []
    game = Game.find(params[:id])
    players_coords = game.game_ships.find_by(player_id: session[:user_id]).coordinates
    players_coords.each do |coordinate|
       @player_ships.push(coordinate)
    end

    render locals: {game: game, player_ships: @player_ships}

  end


 def create
  @game = Game.create
  redirect_to @game
 end


  def ships
    #create ship
    ship = GameShip.create({game_id: params[:id], player_id: params[:player_id], ship_id: params[:ship]})

    #create ship's first coord
    starting_coordinate = Coordinate.find_by( x_position: params[:starting_coordinate][:pasta][0], y_position: params[:starting_coordinate][:pasta][-1])
    GameShipCoordinate.create({coordinate_id: starting_coordinate.id, game_ship: ship})

    #create remaining coords for ship
    i=0
    continue_coord = starting_coordinate
    while i < Ship.find(ship.ship_id).length-1
      if params[:orientation] == "horizontal"
        coord = Coordinate.find_by(x_position: continue_coord.x_position.next, y_position: continue_coord.y_position)
        new_coord = GameShipCoordinate.create({coordinate_id: coord.id, game_ship: ship})
      else
        coord = Coordinate.find_by(x_position: continue_coord.x_position, y_position: continue_coord.y_position.next)
        new_coord = GameShipCoordinate.create({coordinate_id: coord.id, game_ship: ship})
      end
      continue_coord = Coordinate.find(new_coord.coordinate_id)
      i+=1
    end

    #add ships's coordinates to array of all player's ships' coords
    # ship.game_ship_coordinates.each do |coordinate|
    #   @player_ships.push(Coordinate.find(coordinate.coordinate_id))
    # end

    # Game.find(params[:id]).game_ships.find(session[:user_id]).game_ship_coordinates
    binding.pry
  end


  def edit
    game = Game.find(params[:id])
    render locals: {game: game}
  end

  def update
    @game = Game.find_by(id: params[:id].to_i)
    @game.turn_id = session[:user_id]
    @game.save
    redirect_to @game
  end

  def check
    @game = Game.find_by(id: params[:id].to_i)
    @turn = @game.turn_id == session[:user_id]
    respond_to do |format|
      format.js
      format.html { redirect_to @game}
      format.json { head :no_content }
    end
  end

  def pass
    @game = Game.find_by(id: params[:id].to_i)
    if @game.turn_id = session[:user_id]
     active = @game.turn_id
     case active
     when @game.player1_id
      @game.turn_id = @game.player2_id
     when @game.player2_id
      @game.turn_id = @game.player1_id
     end
    else
      puts "It's not your turn"
    end
    @game.save
    redirect_to@game
  end


end
