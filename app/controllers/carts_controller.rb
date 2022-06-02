class CartsController < ApplicationController
      skip_before_action :authorize_user, only: [:validate_cart_id,:index, :show, :destroy, :create]

    
      def index
        carts = Cart.all
        render json: carts, status: :ok
      end
    
      def show
        validate_cart_id
        cart = Cart.find(params[:cart_id])
        render json: { status: 'SUCCESS', message: 'Loaded cart content',
                       cart_content: cart.phones,
                       }, status: :ok
      end
    
        # POST   /api/v1/carts
      def create
        cart = Cart.create!
        render json: cart, status: :created
      end

      def destroy
        carts = Cart.all
        carts.destroy_all
      end
end
