class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
  end

  def create
    @recipe = Recipe.new(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions])
    @recipe.save
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    recipe = Recipe.find_by(id: params[:id])
    recipe.assign_attributes(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions])
    recipe.save
  end


end
