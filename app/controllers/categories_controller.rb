class CategoriesController < ApplicationController
  before_action :is_admin?
  
  def new
    @category = Category.new
  end 

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to menu_index_path 
    else
      flash[:error] = "Impossible d'ajouter un produit à la base de données !"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "La catégorie a bien été modifiée !"
      redirect_to menu_index_path
    else
      flash[:danger] = "Erreur : ton formulaire n'était pas correct. "
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "La categorie a été supprimée avec succès !"
    redirect_to menu_index_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
