class AdoptionsController < ApplicationController

  def new
    @adoption_form = AdoptionForm.new
    puts params
  end

  def create
    @adoption_form = AdoptionForm.new(adoption_params)
    @adoption_form.cat = find_cat

    if @adoption_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def adoption_params
    params.require(:adoption_form).permit(:first_name, :last_name, :email, :phone_number) 
  end

  def find_cat
    Cat.find(params[:cat_id])
  end
end