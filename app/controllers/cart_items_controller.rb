class CartItemsController < ApplicationController

    skip_before_action :authorize_user, only: [:index, :update, :create, :destroy, :validate_item_quantity, :validate_cart_item ]
    def create
         # ensures that all the required parameters are there and exist
    # in the database.
    validate_phone_id
    validate_cart_id
    validate_item_quantity
    cart = Cart.find(session[:cart_id])
    cart.add_product(params[:id], session[:cart_id])
    
    render json: { status: 'SUCCESS', message: 'Item added to cart.' },
               status: :created
    end

    def update
        # ensures that all the required parameters are there and exist
        # in the database
        validate_phone_id
        validate_cart_id
        validate_item_quantity
    
        cart = Cart.find(params[:cart_id])
        cart.update_cart_item(params[:phone_id], params[:quantity])
    
        render json: cart, status: :ok
    end
    
      # Removes an item from a cart. If the item doesn't exist or the cart
      # doesn't exist then an error is raised
      # DELETE /api/v1/carts/:cart_id/cart_items/:product_id
    def destroy
        # ensures that all the required parameters are there and exist
        # in the database
    validate_phone_id
    validate_cart_id
    validate_cart_item
    cart_item = CartItem.find_by!(phone_id: params[:phone_id], cart_id: params[:cart_id])
    cart_item.destroy!

    render json: cart, status: :ok
    end

    private

# Ensures the item quantity is passed with the request
    def validate_item_quantity
        params.require(:quantity)
    end

# Ensures that the item exists in the cart
    def validate_cart_item
        cart_item = CartItem.find_by(phone_id: params[:phone_id])
        if cart_item.nil?
        raise ArgumentError, 'The item does not exist in the cart'
        end
    end

end
