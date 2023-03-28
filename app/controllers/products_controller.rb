class ProductsController < ApplicationController
  before_action :is_admin?

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to menu_index_path 
    else
      flash[:error] = "Impossible d'ajouter un produit à la base de données !"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:success] = "Le produit a bien été modifié !"
      redirect_to menu_index_path
    else
      flash[:danger] = "Erreur : ton formulaire n'était pas correct. "
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Le produit a été supprimé avec succès !"
    redirect_to menu_index_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
