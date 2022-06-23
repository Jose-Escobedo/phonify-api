class OrdersController < ApplicationController
    before_action :current_cart
    def create
    @order = Order.create(order_params)
    @current_cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
        @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        render json: @order, status: :ok
    end

    def index
        orders = Order.all
        render json: orders, status: :ok
    end
  
private
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_method)
    end

end