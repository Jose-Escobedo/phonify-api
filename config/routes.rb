Rails.application.routes.draw do
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  resources :users, only: [:index, :show, :create, :destroy]
  resources :phones, only: [:index, :show]
  resources :orders, only: [:create, :show, :index]
  post '/orders' => "orders#create"
  get '/Cart' => "carts#show"
  get '/Carts' => "carts#index"
  delete '/carts/:id' => "carts#destroy"
  delete '/carts/empty_carts' => "carts#destroy_all_carts"
  
  post '/cart_items/add' => "cart_items#add_quantity"
  post '/cart_items/reduce' => "cart_items#reduce_quantity"
  post '/cart_items' => "cart_items#create"
  get '/current_cart/cart_items' => "carts#cart_items"
  delete '/cart_items/:id' => "cart_items#destroy"


  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  get '/authorized_user', to: 'users#show'
  delete '/logout', to: 'sessions#logout'

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
