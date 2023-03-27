class AdminController < ApplicationController
before_action :authenticate_user!
before_action :is_admin?

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

  def user_params
  params.require(:user).permit(:pseudo, :email, :password, :is_admin, :password_confirmation)
  end

end

