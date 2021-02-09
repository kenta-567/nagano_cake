class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    
    @sum = 0
    @order.order_details.each do |order_detail|
      sub_total = order_detail.item.price * order_detail.amount
      @sum += sub_total
    end
    @total = @sum
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order.id)
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
  
end
