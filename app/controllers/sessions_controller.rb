class SessionsController < ApplicationController

  def new
  end

  def create
    @player = Player.authenticate(params['session']['username'])
      if @player && @player.password == params['session']['password']
          session[:user_id] = @player.id
          redirect_to root_url
      else
        redirect_to new_session_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
