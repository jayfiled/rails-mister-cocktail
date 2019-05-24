class DosesController < ApplicationController
  before_action :find_cocktail, only: %i[new create]

  def new
    @dose = Dose.new
  end

  def create
    # byebug
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to root_path
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
