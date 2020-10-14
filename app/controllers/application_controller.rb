class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_current_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
  
  # def set_current_user
  #   @current_user = User.find_by(id: session[:user_id])
  # end
  
  # def authenticate_user
  #   if @current_user == nil
  #     flash[:notice] = "ログインが必要です"
  #     redirect_to("/login")
  #   end
  # end
end
