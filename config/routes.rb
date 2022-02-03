Rails.application.routes.draw do



  root "posts#index"
  get "about-us" => "about#index", as: :about
  get "features" => "features#index"

  resources :posts
  resources :twitter_accounts
  resources :tweets

  resources :users
  get "signup" => "users#new"
  post "signup" => "users#create"

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "password" => "passwords#edit", as: :edit_password
  patch "password" => "passwords#update", as: :update_password

  get "password/reset" => "password_resets#new"
  post "password/reset" => "password_resets#create"
  get "password/reset/edit" => "password_resets#edit"
  patch "password/reset/edit" => "password_resets#update"

  get "/auth/twitter/callback" => "omniauth_callbacks#twitter"


end
