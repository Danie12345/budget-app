Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :operations, only: [:index]
  end
  resources :operations, only: [:new, :create, :edit, :update, :destroy]
  get '/get-started', to: 'users#splash'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root to: "groups#index"
end
