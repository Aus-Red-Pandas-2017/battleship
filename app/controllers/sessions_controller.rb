class SessionsController < ApplicationController

  def index

  end

  def show
  end

  def create
    @user = User.authenticate(params['logins']['email'])
      if @user && @user.password == params['logins']['password']
          session[:user_id] = @user.id
          redirect_to '/'
      else
        redirect_to '/'
      end
  end

  def destroy
    session[:user_id]= nil
    redirect_to root_url
  end

end
