class Public::CartItemsController < ApplicationController
  
  
  def index
    @cart_item = CartIteme.new
    @cart_items = CartIteme.all
  end
  

  def create
  end
  

  
  def update
  end
  
  
  def destroy
  end
  
  
  def destroy_all
  end
  
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end
end
