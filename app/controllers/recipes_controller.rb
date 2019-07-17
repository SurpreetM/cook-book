class RecipeController < ApplicationController

    get "/recipes" do
      if logged_in?
      erb :"recipes/recipes"
        else
        redirect to "/login"
      end
    end

    get "/recipes/new" do
      if logged_in?
      erb :"recipes/create_recipe"
        else
          redirect to "/login"
      end
    end

    post "/recipes" do
      if logged_in?
        if params[:name] == "" || params[:ingredients] == "" || params[:instructions] == ""
          redirect to "/recipes/new"
        else
          recipe = current_user.recipes.create(params)
          redirect to "/recipe/#{recipe.id}"
        end
        redirect to "/login"
      end
    end

    get "/recipe/:id" do
      if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :"recipes/show"
      else
        redirect to "/login"
      end
    end

    get "/recipe/:id/edit" do
      if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
        if current_user = @recipe.user
          erb :"recipes/edit"
        else
          redirect to "/recipes"
        end
        redirect to "/login"
      end
    end


end
