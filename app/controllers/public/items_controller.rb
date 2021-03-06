class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, only: :show
  
  def index
    @items = Item.page(params[:page]).per(8)
  end
  

  def show
    @item = Item.find(params[:id])
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price, :is_active)
  end
end
