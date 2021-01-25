class Admin::GenresController < ApplicationController
  
  
  def index
  end
  
  def edit
  end
  
  def create
  end
  
  
  def update
  end
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  
end
