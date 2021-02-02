class ApplicationController < ActionController::Base
  
  # before_action :authenticate_admin!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when :admin
      admin_homes_path
    when :customer
      root_path
    end
  end
  
  def after_sign_up_path_for(resource)
    customers_my_page_path
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when :admin
    new_admin_session_path 
    when :customer
      root_path
    end
  end
  
  
  helper_method :current_cart

  # def current_cart
  #   if session[:cart_item_id]
  #     @cart = CartItem.find(session[:cart_id])
  #   else
  #     @cart = CartItem.create
  #     session[:cart_item_id] = @cart.id
  #   end
  # end
  
  private

  
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number])
   end
  
end
