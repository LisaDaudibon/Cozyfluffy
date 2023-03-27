class AdminController < ApplicationController
before_action :authenticate_user!
before_action :require_admin

def index
end

def create 
  @user = User.new(user_params)
  if @user.save 
    redirect_to admin_index_path 
  else
    flash[:error] = "Echec d'ajout d'utilisateur!"
    render :new
  end
end

def new 
  @user = User.new
end

private

def require_admin
  unless current_user.is_admin == true
    flash[:error] = "You must be an admin to access this page"
    redirect_to root_path
  end 
end

def user_params
 params.require(:user).permit(:pseudo, :email, :password, :is_admin, :password_confirmation)
end

end      

