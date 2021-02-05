class Public::OrdersController < ApplicationController
  
  
  def show
    @order = Order.find(params[:id])
  end
  

  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end
  
  
  def confilm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
   
    @sum = 0
    @cart_items.each do |cart_item|
      sub_total = cart_item.item.price.to_i * cart_item.amount.to_i
      @sum += sub_total
    end
    @total = @sum
    @order.shipping_cost = Order.find_by(shipping_cost: 800)
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save!
      redirect_to orders_thanks
    else
      render :new
    end
  end
  
  def thanks
  end
  
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at, :updated_at)
  end
  
  
end
