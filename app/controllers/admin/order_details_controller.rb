class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(user_params)
    redirect_to admin_order_path(@order_detail.id)
  end
  
  
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status, :created_at, :updated_at)
  end
  
end
