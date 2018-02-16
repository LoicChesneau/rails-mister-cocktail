class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    redirect_to(new_cocktail_dose_path(@cocktail.id))
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render :new
    # end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
