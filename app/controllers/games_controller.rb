class GamesController < ApplicationController

  def index
    @games = Game.all
    @player_ships = []
    @total_coords = []
    render locals: {player_ships: @player_ships}
  end

  def join
    @game = Game.find(params[:id])
    @game.player2_id = session[:user_id]
    @game.save
    redirect_to @game
  end

  def show
    opponent_ships = []
    @player_ships = []
    game = Game.find(params[:id])
    @total_coords = []
    if Game.find(params[:id]).game_ships.find_by(player_id: session[:user_id])
    @bunch_o_ships = Game.find(params[:id]).game_ships.where(player_id: session[:user_id])


    @bunch_o_ships.each do |ship|
      ship.coordinates.each do |coordinate|
        @total_coords.push(Coordinate.find(coordinate.id))
      end
    end
  end

  current_player1_id = Game.find(params[:id]).player1_id
  current_player2_id = Game.find(params[:id]).player2_id
  game = Game.find(params[:id])

  if current_player1_id == session[:user_id]
    @player2_ships = Game.find(params[:id]).game_ships.where(player_id: current_player2_id)
      hits = []

     @player2_ships.each do |ship|
      hits.push(ship.game_ship_coordinates)
     end

      hits = hits.flatten
      hits.each do |x|
        if x.is_hit
          x = x.coordinate
          opponent_ships.push(x)
        end
      end

  else
      @player1_ships = Game.find(params[:id]).game_ships.where(player_id: current_player1_id)
      hits = []

     @player1_ships.each do |ship|
      hits.push(ship.game_ship_coordinates)
     end

      hits = hits.flatten
      hits.each do |x|
        if x.is_hit
          x = x.coordinate
          opponent_ships.push(x)
        end
      end

  end
    #get player1s game_ship_coordinates

  player_ships = @total_coords


    # players_coords = game.game_ships.find_by(player_id: session[:user_id]).coordinates
    # players_coords.each do |coordinate|
    #    @player_ships.push(coordinate)
    # end

    render locals: {game: game, player_ships: player_ships, opponent_ships: opponent_ships}
  end

  def attack
    attack = params[:attack][:pasta]
    attack_coordinate = Coordinate.find_by( x_position: params[:attack][:pasta][0], y_position: params[:attack][:pasta][-1])

    current_player1_id = Game.find(params[:id]).player1_id
    current_player2_id = Game.find(params[:id]).player2_id
    game = Game.find(params[:id])

    if current_player1_id == session[:user_id]

      @all_player2_ship_coords = []
      @player2_ships = Game.find(params[:id]).game_ships.where(player_id: current_player2_id)


      targets = []
       @player2_ships.each do |ship|
        targets.push(ship.game_ship_coordinates)
        targets[0].each do |target|
           if target.coordinate_id == attack_coordinate.id
            target.is_hit = true
            target.save

            end
          end

        end

    else


      @all_player1_ship_coords = []
      @player1_ships = Game.find(params[:id]).game_ships.where(player_id: current_player1_id)

      targets = []

      @player1_ships.each do |ship|
        targets.push(ship.game_ship_coordinates)

          targets[0].each do |target|

              if target.coordinate_id == attack_coordinate.id
              target.is_hit = true
              target.save
          

              end
          end
      end
     end
  end

 def create
  @game = Game.create(player1_id: session[:user_id], turn_id: session[:user_id])
  redirect_to @game
 end


  def ships
    #create ship
    ship = GameShip.create({game_id: params[:id], player_id: params[:player_id], ship_id: params[:ship]})

    #create ship's first coord
    our_y = params[:starting_coordinate][:pasta][-1]
    if our_y == "0"
      our_y = "10"
    end
    
    starting_coordinate = Coordinate.find_by( x_position: params[:starting_coordinate][:pasta][0], y_position: our_y)
    #if starting_coordinate
    # binding.pry
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
    # @new_ship = []
    # ship.game_ship_coordinates.each do |coordinate|
    #   @new_ship.push(Coordinate.find(coordinate.coordinate_id))
    # end

    # @total_coords = []
    # @player_coords = Game.find(params[:id]).game_ships.find_by(player_id: session[:user_id]).game_ship_coordinates

    # @player_coords.each do |coordinate|
    #   @total_coords.push(Coordinate.find(coordinate.coordinate_id))
    # end

    # @total_coords = @total_coords.push(@new_ship)
    @game = Game.find(params[:id])
    redirect_to @game
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
    redirect_to @game
  end
end




