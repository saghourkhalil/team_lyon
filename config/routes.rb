Rails.application.routes.draw do
  get "items/index"
  root 'items#index'
  get 'items/profil'
  post 'items/profil'

  devise_for :users

  resources :items


  resources :carts, only: [:show]

  resources :cart_items, only: [:create, :update, :destroy]

  resources :charges, only: [:new, :create]


end
