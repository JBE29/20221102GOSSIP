Rails.application.routes.draw do
  resources :likes
  resources :comments
  root 'gossips#index'
  get '/contact', to: 'static_page#contact'
  get '/equipe', to: 'static_page#team'

  resources :gossiptags
  resources :private_messages
  resources :tags
  resources :gossips
  resources :cities
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
