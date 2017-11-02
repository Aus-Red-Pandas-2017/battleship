class SessionsController < ApplicationController

  def new

  end

  def create
    @player = Player.authenticate(params['session']['username'])
      if @player #&& @player.password == params['session']['password']
          session[:user_id] = @player.id
          redirect_to '/games/1'
      else
        redirect_to '/games/1'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/games/1'
  end

end
