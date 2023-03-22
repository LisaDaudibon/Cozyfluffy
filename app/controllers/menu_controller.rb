class MenuController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def new
  end

  def create 

  end

  def edit
  end

  def update

  end

  def destroy

  end
end
