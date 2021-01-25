class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @items = Item.find(params[:id])
  end
  
  def show
    @items = Item.all
    @item = Item.find(params[:id])
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :show
    end
  end
  
  def edit
  end
  
  def update
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active)
  end
  
end
