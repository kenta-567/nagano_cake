class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @items = Item.all
    @item = Item.find(params[:id])
    if @item.save
      redirect_to admin_items_path
    else
      render :show
    end
  end
  
  def show
    @item = Item.find(params[:id])
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
