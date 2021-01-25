class Public::OrdersController < ApplicationController
  
  
  def show
  end
  

  def index
  end
  
  def new
  end
  
  
  def confilm
  end
  
  def create
  end
  
  def thanks
  end
  
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at, :updated_at)
  end
  
  
end
