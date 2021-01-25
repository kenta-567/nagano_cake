class Admin::OrderDetailsController < ApplicationController
  
  def update
  end
  
  
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status, :created_at, :updated_at)
  end
  
end
