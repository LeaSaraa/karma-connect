Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: [:index, :show]

  resources :my_posts , only: [:new, :create, :index]
  resources :users, only: [:show, :update, :edit]

 # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages
end
