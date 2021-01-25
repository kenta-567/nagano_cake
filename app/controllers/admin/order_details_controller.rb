class Admin::OrderDetailsController < ApplicationController
  
  def update
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status)
  end
  
end
