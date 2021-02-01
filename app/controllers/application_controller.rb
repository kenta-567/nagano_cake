class ApplicationController < ActionController::Base
  
  # before_action :authenticate_admin!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_path
    when Customer
      root_path
    end
  end
  
  def after_sign_up_path_for(resource)
    customers_my_page_path
  end
  
  # def after_sign_out_path_for(resource)
  #   case resource
  #   when Admin
  #   new_admin_session_path 
  #   when Customer
  #     root_path
  #   end
  # end
  
  
  
  
  
  
  
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number])
   end
  
end
