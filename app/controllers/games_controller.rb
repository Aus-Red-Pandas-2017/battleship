class GamesController < ApplicationController

  def index
  end

  def show
    game = Game.find(params[:id])
    render locals: {game: game}
  end

  def update

    @game = Game.find_by(id: params[:id].to_i)
    @game.turn_id = session[:user_id]
    @game.save
    redirect_to @game

  end




end
