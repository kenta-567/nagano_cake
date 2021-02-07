class Public::OrdersController < ApplicationController
  
  
  def show
    @order = Order.find(params[:order][:id])
  end
  

  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end
  
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    
    if address_params[:address_kind] == "1" 
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif address_params[:address_kind] == "2"
      address = Address.find(order_params[:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    end
  
    @sum = 0
    @cart_items.each do |cart_item|
      sub_total = cart_item.item.price.to_i * cart_item.amount.to_i
      @sum += sub_total
    end
    @total = @sum
    @order.shipping_cost = 800
    @order.total_payment = @order.shipping_cost + @total
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save!
      @order_detail = OrderDetail.new
      @order_detail = current_customer.cart_items
      @order_detail = @order
      @order_detail.save!
      redirect_to orders_thanks_path
    else
      render :new
    end
  end
  
  def thanks
  end
  
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  
  def address_params
    params.require(:address).permit(:address_kind)
  end
  
  
end
