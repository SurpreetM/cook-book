class RecipeController < ApplicationController

    get "/recipes" do
      erb :"recipes/recipes"
    end

end
