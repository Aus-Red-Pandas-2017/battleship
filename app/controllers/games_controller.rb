class GamesController < ApplicationController


  def index
  end

  def show

    game = Game.find(params[:id])

    render locals: {game: game}
  end

  def my_turn
  end

  def im_done
  end


end
