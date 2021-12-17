Rails.application.routes.draw do

  root "posts#index"
  get "about-us" => "about#index", as: :about
  get "features" => "features#index"

  resources :posts

  resources :users
  get "signup" => "users#new"

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  
end
