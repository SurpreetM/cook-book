class RecipeController < ApplicationController

    get "/recipes" do
      erb :"recipes/recipes"
    end

    get "/recipes/new" do
      erb :"recipes/create_recipe"
    end

    post "/recipes" do
      @recipe = Recipe.create(params)
      erb :"recipes/show"
    end

end
