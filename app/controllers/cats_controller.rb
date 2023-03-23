class CatsController < ApplicationController
  def index
    @cats = Cat.all
    @catsresidents = Cat.where(adoption: false)
    @catsadoptables = Cat.where(adoption: true)
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.create(cat_params)

    if @cat.save 
      redirect_to admin_index_path 
    else
      flash[:error] = "Echec d'ajout de minou!"
      render :new
    end
  end

  def new
    @cat = Cat.new
  end

  def edit 
    @cat = Cat.find(params[:id])

  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:success] = "Le cat a bien été modifié !"
      redirect_to cat_path(:id)
    else
      flash[:danger] = "Erreur : ton formulaire n'était pas correct. Le titre ne doit pas faire moins de 3 chars ou plus de 14 ! Et il doit y avoir un contenu !"
      render 'edit', status: :unprocessable_entity
    end

  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    flash[:success] = "Le chat a été supprimé avec succès !"
    redirect_to root_path
  end
  private 

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :description, :adoption)

  end

end
