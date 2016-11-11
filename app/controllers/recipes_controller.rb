class RecipesController < ApplicationController

  def home
    # @recipe = Recipe.first
    # @recipe2 = Recipe.second
    # @recipe3 = Recipe.last

    @recipes = Recipe.all
  end


end
