Rails.application.routes.draw do
  get '/' => 'users#index'

  resources :users, only: [:index, :create]
  post '/login' => 'users#login'
  delete '/logout' => 'users#logout'
  post '/games' => 'games#create'
  get '/games/:game_id/results' => 'games#results'
  resources :rounds, only: [:index, :update]
end
