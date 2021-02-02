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
    # @cart_item.amount = @cart_item.amount + params[:amount]
    @cart_item.save
    redirect_to public_cart_items_path
  end


  
  def update
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to public_cart_items_path
  end
  
  
  def destroy
    @cart_item.destroy
    redirect_to current_cart
  end
  
  
  def destroy_all
  end
  
  



end
