class RecipesController < ApplicationController

  def home
    # @recipe = Recipe.first
    # @recipe2 = Recipe.second
    # @recipe3 = Recipe.last

    @recipes = Recipe.all
  end

  def new
  end

  def save
    @recipe = Recipe.new(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions])

    @recipe.save
  end


end
