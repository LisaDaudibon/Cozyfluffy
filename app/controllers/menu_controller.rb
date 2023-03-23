class MenuController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.create(product_params)
    if @product.save 
      redirect_to admin_index_path 
    else
      flash[:error] = "Echec d'ajout de minou!"
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
      redirect_to cat_path(:id)
    else
      flash[:danger] = "Erreur : ton formulaire n'était pas correct. Le titre ne doit pas faire moins de 3 chars ou plus de 14 ! Et il doit y avoir un contenu !"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @product.find = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Le produit a été supprimé avec succès !"
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end


end
