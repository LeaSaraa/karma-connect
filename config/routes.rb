Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: [:index]
  resources :my_posts , only: [:new, :create, :index]
  resources :users, only: [:show, :update, :edit]
end
