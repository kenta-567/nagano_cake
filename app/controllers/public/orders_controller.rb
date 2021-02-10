class Public::OrdersController < ApplicationController
  
  
  def show
    @order = Order.find(params[:id])
    
    @sum = 0
    @order.order_details.each do |order_detail|
      sub_total = order_detail.item.price * order_detail.amount
      @sum += sub_total
    end
    @total = @sum
  end
  

  def index
    if params[:customer_id].blank?
      @orders = Order.page(params[:page])
    else
      @orders = Order.where(customer_id: params[:customer_id]).page(params[:page])
    end
  end
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
  
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    if address_params[:address_kind] == "1" 
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif address_params[:address_kind] == "2"
      address = Address.find(params[:order]["address_id"])
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
      current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new({
        order_id: @order.id,
        price: cart_item.item.price,
        item_id: cart_item.item_id,
        amount: cart_item.amount
      })
      @order_detail.save!
    end
      current_customer.cart_items.delete_all
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
