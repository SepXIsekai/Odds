class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    rooms_path  
  end

  def after_sign_up_path_for(resource)
    rooms_path  
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path 
  end
end
