class AdminController < ApplicationController
before_action :authenticate_user!
before_action :require_is_admin, only: [:index]
      
def index
end
      
private
      
  def require_is_admin
    unless current_user.is_admin?
     redirect_to root_path, alert: "Access denied."
   end
  end
end      

