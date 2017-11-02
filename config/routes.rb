Rails.application.routes.draw do

  get 'home/index'
  resources :sessions
  resources :players
  resources :games, except: [:new] do
    member do
      get 'check'
      patch 'pass'
      post 'ships'
    end
  end


  get "logout", to: 'sessions#destroy',  as: :logout_my_shit

  get "login",to: 'sessions#new'

  post "login", to: 'sessions#create'

  root to: "games#index"

end
