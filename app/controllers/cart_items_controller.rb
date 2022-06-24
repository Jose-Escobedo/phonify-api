class CartItemsController < ApplicationController
    # skip_before_action :authorize_user, only: [:create, :show, :destroy, :add_quantity, :reduce_quantity]
    before_action :current_cart
    def show
        @cart = @current_cart
        render json: @cart.cart_items, status: :ok
    end
 
    
    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
    end 

    def create
        # Find associated product and current cart
        chosen_product = Phone.find(params[:phone_id])
        current_cart = @current_cart

        if current_cart.phones.include?(chosen_product)
            raise ArgumentError, 'Product is already added to cart.'
        else
            @cart_item = CartItem.new
            @cart_item.cart = current_cart
            @cart_item.phone = chosen_product
            @cart_item.quantity =1
            @cart_item.phone.update_attribute(:quantity, 1)
            @cart_item.quantity = @cart_item.quantity.to_i
        end
  
        @cart_item.save
        render json: @current_cart.phones, status: :ok
    end

    def add_quantity
        @cart_item = @current_cart.cart_items.find_by(phone_id: params[:phone_id])
        @cart_item.increment!(:quantity)
        @cart_item.phone.update_attribute(:quantity, @cart_item.quantity)
        @cart_item.save
        render json: @cart_item, status: :ok
    end
      
    def reduce_quantity
        @cart_item = @current_cart.cart_items.find_by(phone_id: params[:phone_id])
        if @cart_item.quantity == 1
          @cart_item.destroy
        else
          @cart_item.decrement!(:quantity)
          @cart_item.phone.update_attribute(:quantity, @cart_item.quantity)
        end
        @cart_item.save
        render json: @cart_item, status: :ok
    end


      
    private
        def cart_item_params
          params.require(:cart_item).permit(:quantity,:phone_id, :cart_id)
        end

end
