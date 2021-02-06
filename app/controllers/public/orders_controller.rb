class Public::OrdersController < ApplicationController
  
  
  def show
    @order = Order.find(params[:id])
  end
  

  def index
    @orders = Order.all
    @cart_items = current_customer.cart_items
  end
  
  def new
    @order = Order.new
  end
  
  
  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    
    
    if address_params[:address_kind] == "1" 
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif address_params[:address_kind] == "2"
      @order.postal_code = Address.where(postal_code: address_id)
      @order.address = Address.where(address: address_id)
      @order.name = Address.where(name: address_id)
    end
        
    @sum = 0
    @cart_items.each do |cart_item|
      sub_total = cart_item.item.price.to_i * cart_item.amount.to_i
      @sum += sub_total
    end
    @total = @sum
    @order.shipping_cost = 800
    @order.total_payment = @order.shipping_cost + @total
    session[:order] = @order
  end
  
  def create
    @order = session[:order]
    if @order.save!
      @order = OrderDetails
      
      session[:order] = nil
      redirect_to orders_thanks
    else
      render :new
    end
  end
  
  def thanks
  end
  
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :order)
  end
  
  def address_params
    params.require(:address).permit(:address_kind)
  end
  
  
end
