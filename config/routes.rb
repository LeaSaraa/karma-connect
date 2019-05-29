Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: [:index]

  resources :users, only: [:show, :update, :edit]

  resources :my_posts , except: [:destroy]
end
