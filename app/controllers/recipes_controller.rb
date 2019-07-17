class RecipeController < ApplicationController

    get "/recipes" do
      if logged_in?
      erb :"recipes/recipes"
        else
        redirect to "/"
      end
    end

    get "/recipes/new" do
      if logged_in?
      erb :"recipes/create_recipe"
        else
          redirect to "/"
      end
    end

    post "/recipes" do
      recipe = Recipe.create(params)
      redirect to "/recipe/#{recipe.id}"
    end

    get "/recipe/:id" do
      @recipe = Recipe.find_by_id(params[:id])
      erb :"recipes/show"
    end


end
