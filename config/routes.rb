Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :posts, only: [:index, :show] do
  resources :comments, only: [ :new, :create, :index ]
  end
  resources :users, only: [:show, :update, :edit] do
    resources :compliments, only: [:new, :create, :index]
  end
  resources :my_posts , only: [:new, :create, :index] do
    member do
      patch :active
      patch :done
    end
  end


 # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages
end
