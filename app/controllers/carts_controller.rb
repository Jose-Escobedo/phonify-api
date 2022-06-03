class CartsController < ApplicationController
      skip_before_action :authorize_user, only: [:index, :show, :destroy, :create]

      def show
        @cart = @current_cart
        render json: {cart:@cart, cart_items: @cart.cart_items}, status: :ok
      end
    
      def destroy
        @cart = @current_cart
        @cart.destroy
        render json: @cart, status: :ok
      end
end
