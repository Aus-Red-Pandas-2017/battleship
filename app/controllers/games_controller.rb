class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def join
    @game = Game.find(params[:id])
    @game.player2_id = session[:user_id]
    @game.save
    redirect_to @game
  end

  def show
    game = Game.find(params[:id])
    render locals: {game: game}
    #@game
  end


 def create
  @game = Game.create(player1_id: session[:user_id], turn_id: session[:user_id])
  redirect_to @game
 end


 # Game.find(params[:id]).game_ships.find(session[:user_id]).game_ship_coordinates

  def ships
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




