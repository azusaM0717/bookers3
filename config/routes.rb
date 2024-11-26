Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about", to: "homes#about"
  resources :books, only: [:show, :create, :index, :edit, :destroy]
  resources :users, only: [:show, :index, :edit, :update]

end
