class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show delete]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    @cocktail.save!

    redirect_to :root
  end

  def destroy
    @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
