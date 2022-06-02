Rails.application.routes.draw do
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  resources :users, only: [:index, :show, :create, :destroy]
  resources :phones, only: [:index, :show]
  resources :carts, only: [:index, :create, :show, :destroy, :update]
  resources :cart_items, only: [:index, :create, :show, :destroy, :update]
  # resources :teams, only: [:index, :show]
  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  get '/authorized_user', to: 'users#show'
  delete '/logout', to: 'sessions#logout'
end
