class OrdersController < ApplicationController
  before_action :current_cart
  def create
  @current_order = Order.create(order_params)
  @current_cart.cart_items.each do |item|
    @current_order.cart_items << item
    item.cart_id = nil
  end
      @current_order.save
      OrderMailer.order_mail(@current_order).deliver_now
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      render json: @current_order, status: :ok
  end

  def index
      @orders = Order.all
      render json: @orders, status: :ok
  end

  
private
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_method, :delivery_instructions, :total)
    end

end