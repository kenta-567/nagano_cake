class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items
  end
  

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
    if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
    end
 
    @cart_item.amount += params[:amount].to_i
    @cart_item.save
    redirect_to public_cart_items_path
  end


  
  def update
    @cart_item = current_customer.cart_items.find_by(params[:item_id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  
  
  def destroy
    @cart_item = current_customer.cart_items.find_by(params[:item_id])
    @cart_item.destroy
    redirect_to  public_cart_items_path
  end
  
  
  def destroy_all
  end
  
private
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end


end
