Rails.application.routes.draw do

  # devise_for :users
  resources :users
  resources :attractions
  
  get "/signin", to: 'sessions#new', as: 'signin' 
  post "/sessions/create", to: 'sessions#create' 
  delete "/signout", to: 'sessions#destroy', as: :signout 
  post "/rides", to: 'rides#create'




root to: 'welcome#home'
end