class Admin::HomesController < ApplicationController
  
  def top
    
    if params[:user_id].blank?
      @orders = Order.page(params[:page])
    else
      @orders = Order.where(customer_id: params[:user_id]).page(params[:page])
    end
  end

end
