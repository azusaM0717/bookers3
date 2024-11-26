Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about", to: "homes#about"
  resources :books, only: [:show, :create, :index, :edit, :destroy]
  resources :users, only: [:new, :show, :create, :index, :edit, :update]

end
