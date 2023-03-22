class MenuController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show

  end

  def new
  end

  def edit
  end
end
