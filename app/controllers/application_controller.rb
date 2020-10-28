class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile] )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image_id] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image_id])
    
  end
  
  def after_sign_in_path_for(resource)
    gears_path(resource)
  end
  
  def authenticate_user
    unless user_signed_in?
      flash[:alert] = "アカウント登録もしくはログインしてください。"
      redirect_to "/users/sign_in"
    end
  end
end
