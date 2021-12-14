Rails.application.routes.draw do

  root "posts#index"
  get "about-us" => "about#index", as: :about
  get "features" => "features#index"

  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end