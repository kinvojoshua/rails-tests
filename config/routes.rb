Rails.application.routes.draw do

  root "landing#index"

  resources :posts
  # resources :author
end
