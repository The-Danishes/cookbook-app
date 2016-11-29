class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    sort_column = params[:sort]
    @recipes = current_user.recipes.order(sort_column)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])

    if current_user.id != @recipe.user_id
      redirect_to "/"
    end
  end

  def new
  end

  def create
    @recipe = Recipe.new(title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions],
                        user_id: current_user.id)
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
