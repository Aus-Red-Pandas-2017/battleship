Rails.application.routes.draw do

  get 'home/index'

  resources :games, :players

  patch 'games/:id', to: 'games#my_turn'



  root to: "games#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
