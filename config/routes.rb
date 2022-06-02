Rails.application.routes.draw do
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  resources :users, only: [:index, :show, :create, :destroy]
  resources :phones, only: [:index, :show]
  # resources :teams, only: [:index, :show]
  resources :carts, only: [:show], param: :cart_id
  resources :carts, only: [:create, :index]
  delete 'carts', to: 'carts#destroy'
  post 'carts/:cart_id/cart_items/:phone_id', to: 'cart_items#create'  
  patch 'carts/:cart_id/cart_items/:phone_id', to: 'cart_items#update'                        
  delete 'carts/:cart_id/cart_items/:phone_id', to: 'cart_items#destroy' 


  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  get '/authorized_user', to: 'users#show'
  delete '/logout', to: 'sessions#logout'
end
