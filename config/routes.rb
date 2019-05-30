Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :posts, only: [:index, :show]
  resources :users, only: [:show, :update, :edit]
  resources :my_posts , only: [:new, :create, :index] do
    member do
      patch :active
      patch :done
    end
  end

 