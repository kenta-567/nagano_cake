class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  
  
  def after_sign_in_path_for(resource)
    admin_homes_path
  end
  
  def after_sign_out_path_for(resource)
    new_admin_session_path 
  end
  
end
