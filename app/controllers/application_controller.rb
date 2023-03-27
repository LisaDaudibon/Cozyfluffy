class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :is_admin?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:pseudo, :email, :password, :password_confirmation, :current_password)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:pseudo, :email, :password, :password_confirmation, :current_password)}
  end

end
