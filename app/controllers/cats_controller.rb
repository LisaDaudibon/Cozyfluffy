class CatsController < ApplicationController
  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end
  private 

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :description, :adoption)

  end

end
