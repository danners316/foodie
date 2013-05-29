class CommentsController < ApplicationController
def create

  @recipe = Recipe.find(params[:recipe_id])
  if request.post?
  @recipe.comments.create(params[:comment])

    redirect_to @recipe, :notice => 'Comment added!'
   end
end
end

