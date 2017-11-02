class PlayersController < ApplicationController

  def show
  end

  def index
      current_user = Player.find_by_id(session[:user_id])
  end

  def new

  end

  def create

    @player = Player.create({username: params[:user][:username], password: params[:user][:username]})
    session[:user_id] = @player.id
    redirect_to root_url
  end

end

