Rails.application.routes.draw do
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  resources :users, only: [:index, :show, :create, :destroy]
  resources :phones, only: [:index, :show]
  # resources :teams, only: [:index, :show]
  get 'carts/:id' => "carts#show"
  delete 'carts/:id' => "carts#destroy"
  
  post 'cart_items/add' => "cart_items#add_quantity"
  post 'cart_items/reduce' => "cart_items#reduce_quantity"
  post 'cart_items' => "cart_items#create"
  get 'cart_items/:id' => "cart_items#show"
  delete 'cart_items/:id' => "cart_items#destroy"


  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  get '/authorized_user', to: 'users#show'
  delete '/logout', to: 'sessions#logout'
end
