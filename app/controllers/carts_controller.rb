class CartsController < ApplicationController
      skip_before_action :authorize_user, only: [:cart_items, :index, :show, :destroy, :create]
      before_action :current_cart
      def show
        @cart = @current_cart
        render json: @cart.phones, status: :ok
      end

      def cart_items
        @cart = @current_cart
        render json: @cart.cart_items, status: :ok
      end

      def index
        @carts = Cart.all
        render json: @carts, status: :ok
      end
    
      def destroy
        @cart = @current_cart
        @cart.destroy
        render json: @cart, status: :ok
      end
end
