Rails.application.routes.draw do

  get 'home/index'
  resources :sessions
  resources :players
  resources :game_ships
  resources :games do
    member do
      get 'check'
      patch 'pass'
    end
  end

  get 'games/:id/ships', to: 'games#ships'

  get "logout", to: 'sessions#destroy',  as: :logout_my_shit

  get "login",to: 'sessions#new'

  post "login", to: 'sessions#create'

  root to: "games#index"

end
