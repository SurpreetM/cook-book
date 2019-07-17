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
          redirect to "/recipes/#{recipe.id}"
        end
        redirect to "/login"
      end
    end

    get "/recipes/:id" do
      if logged_in?
      @recipe = Recipe.find_by_id(params[:id])
      erb :"recipes/show"
      else
        redirect to "/login"
      end
    end

    get "/recipes/:id/edit" do
      if !logged_in?
        redirect to "/login"
      else
      @recipe = Recipe.find_by_id(params[:id])
        if current_user = @recipe.user
          erb :"recipes/edit"
        else
          redirect to "/recipes"
        end
      end
    end

    #this is not working
    delete "/recipes/:id/delete" do
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.delete
      redirect to "/recipes"
    end

    post '/recipes/1/delete' do
    "Hello World"
    end



end
