class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  

  def create
    @addresses = current_customer.addresses
    @address = Address.new(address_params)
    if @address.save
      redirect_to public_addresses_path
    else
      render :index
    end
    
  end
  

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end
  
  
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name).merge(customer_id: current_customer.id)
  end
  
end
