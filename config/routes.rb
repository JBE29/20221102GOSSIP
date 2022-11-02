Rails.application.routes.draw do
  resources :gossiptags
  resources :private_messages
  resources :tags
  resources :gossips
  resources :cities
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
