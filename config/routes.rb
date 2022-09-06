Rails.application.routes.draw do
  devise_for :users
  resources :operations
  resources :groups
  resources :users, only: [:show, :destroy, :splash]
  get '/get-started', to: 'users#splash'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root to: "groups#index"
end
