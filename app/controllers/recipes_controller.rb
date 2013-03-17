class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.blank?
      redirect_to '/'
    end
  end
end
