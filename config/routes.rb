Rails.application.routes.draw do

  get 'home/index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :players
  resources :games, except: [:new] do
    member do
      get 'join'
      get 'check'
      patch 'pass'
      post 'ships'
      post 'attack'
    end
  end


  delete 'logout', to: 'sessions#destroy'

  root to: "games#index"

end
