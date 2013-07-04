class RecipesController < ApplicationController
  def index
    @title = 'Recipes'
    @user = User.all
    @recipes = Recipe.all
    @recipes = Recipe.search(params[:search_query])
    end

  def create
    @recipe = current_user.recipes.build(params[:recipe])
    if request.post?
      if @recipe.save
        redirect_to current_user, :notice => 'Recipe created!'
      else
        redirect_to current_user, :notice => 'Recipe was not created, Sorry.'
      end
    end
    @title = "Create A Recipe!"
    
  end

  def show
    if current_user
    @recipe = Recipe.find(params[:id])
    @comment = @recipe.comments.build
    @comments = @recipe.comments.paginate(:page => params[:page], :per_page => 2)
    @title = "#{@recipe.name}"
     else
      redirect_to site_index_path, :notice => 'Login To view Recipes'




    end

  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path :notice => 'User was Destroyed'
  end


  def dairy_free
    @title = 'Dairy Free Recipes'
    @recipes = Recipe.find(:all, :conditions => { :dairy_free => true })
  end

  def gluten_free
    @title = 'Gluten Free Recipes'
    @recipes = Recipe.find(:all, :conditions => { :gluten_free => true })
  end

  def low_fat
    @title = 'Low fat Recipes'
    @recipes = Recipe.find(:all, :conditions => { :low_fat => true })
  end



end
