Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about", to: "homes#about"
  get "/search", to: "searches#search"

  resources :books, only: [:show, :create, :index, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" =>"relationships#followers", as: "followers"
  end
end
