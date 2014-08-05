Rails.application.routes.draw do

  # Routes for index page and Posts_Controller
  root 'posts#index'
  resources :posts

  # Routes for creating a user
  get 'users/new' => 'users#new', as: 'signup'
  post 'users' => 'users#create'

  # Routes for logging in
  get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: 'logout'

end
