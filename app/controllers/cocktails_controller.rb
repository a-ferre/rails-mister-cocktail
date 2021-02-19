class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path, notice: 'Cocktail created'
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)

  end


end
