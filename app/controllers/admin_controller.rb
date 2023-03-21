class AdminController < ApplicationController
before_action :authenticate_user!
before_action :require_admin
      
def index
end

private

def require_admin
  unless current_user.is_admin == true
    flash[:error] = "You must be an admin to access this page"
    redirect_to root_path
  end 
end

end      

