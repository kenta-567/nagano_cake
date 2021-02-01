class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(current_customer.id)
  end
  

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to root_path(@customer.id)
    end
  end
  
  
  def unsubscribe
  end
  
  
  
  def withdrawal
  end
  
  
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
end
