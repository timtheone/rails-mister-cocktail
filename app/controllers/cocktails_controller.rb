class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.order("lower(name) ASC").all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo, :photo_cache)
  end
end
