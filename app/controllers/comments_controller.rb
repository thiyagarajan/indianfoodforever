class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.create(params[:comment])
    redirect_to recipe_path(@recipe)
    flash[:notice]='Successfully added comment'
  end
end
