class CategoriesController < ApplicationController
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
    @gategory = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "La catégorie a bien été modifiée !"
      redirect_to admin_index_path(:id)
    else
      flash[:danger] = "Erreur : ton formulaire n'était pas correct. "
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @category.find = Category.find(params[:id])
    @category.destroy
    flash[:success] = "La categorie a été supprimée avec succès !"
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
