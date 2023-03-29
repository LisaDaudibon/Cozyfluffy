class AdminController < ApplicationController
before_action :authenticate_user!
before_action :is_admin?

  def index
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      redirect_to admin_user_path 
    else
      flash[:error] = "Echec d'ajout d'utilisateur!"
      render :new
    end
  end

  def new 
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "Le produit a bien été modifié !"
      redirect_to admin_user_path
    else
      flash[:danger] = "Erreur : ton formulaire n'était pas correct. "
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "L'utilisateur a été supprimé avec succès !"
    redirect_to admin_user_path
  end

  private

  def user_params
    params.require(:user).permit(:pseudo, :email, :password, :is_admin, :password_confirmation)
  end
end

