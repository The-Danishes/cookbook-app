class RecipesController < ApplicationController

  def index
    sort_column = params[:sort]
    @recipes = Recipe.all.order(sort_column)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
  end

  def create
    @recipe = Recipe.new(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions])
    @recipe.save

    flash[:success] = "Recipe has been created!"

    redirect_to "/recipes/#{@recipe.id}"
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    recipe = Recipe.find_by(id: params[:id])
    recipe.assign_attributes(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions])
    recipe.save

    flash[:success] = "You have edited the recipe."

    redirect_to "/recipes/#{recipe.id}"
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy

    flash[:danger] = "Recipe has been deleted!" 
    redirect_to "/recipes"
  end


  def search
    @search_term = params[:search]
    @recipes = Recipe.where("title LIKE ?", "%#{@search_term}%")
    render :index
  end


end
