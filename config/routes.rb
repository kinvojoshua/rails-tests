Rails.application.routes.draw do

  root "landing#index"

  resources :posts
  resources :users

  # resources :author
end
