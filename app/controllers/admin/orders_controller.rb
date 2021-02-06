class Admin::OrdersController < ApplicationController
  
  def show
    @order_details = Order.where(customer_id: @customer.id)
  end
  
  def update
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  
end
