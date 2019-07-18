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
          flash[:message] = "Please ensure all the fields are populated."
          redirect to "/recipes/new"
        else
          recipe = current_user.recipes.create(name: params[:name].capitalize, ingredients: params[:ingredients], instructions: params[:instructions])
          flash[:message] = "You have successfully added this new recipe."
          redirect to "/recipes/#{recipe.slug}"
        end
        redirect to "/login"
      end
    end

    get "/recipes/:slug" do
      if logged_in?
      @recipe = Recipe.find_by_slug(params[:slug])

      erb :"recipes/show"
      else
        redirect to "/login"
      end
    end

    get "/recipes/:slug/edit" do
      if !logged_in?
        redirect to "/login"
      else
      @recipe = Recipe.find_by_slug(params[:slug])
        if current_user == @recipe.user
          erb :"recipes/edit"
        else
          flash[:message] = "Sorry can only edit your own recipes."
          redirect to "/recipes"
        end
      end
    end

    delete "/recipes/:slug/delete" do
      if !logged_in?
        redirect to "/login"
      else
        @recipe = Recipe.find_by_slug(params[:slug])
        if current_user == @recipe.user
          flash[:message] = "You have deleted your #{@recipe.name} recipe."
          @recipe.delete
          redirect to "/recipes"
        else
          flash[:message] = "Sorry you can only delete your own recipes."
          redirect to "/recipes"
        end
      end
    end

    patch "/recipes/:slug/edit" do
      if !logged_in?
        redirect to "/login"
      else
        if params[:name] == "" || params[:ingredients] == "" || params[:instructions] == ""
          flash[:message] = "Please ensure all the fields are populated."
          redirect to "/recipes/#{params[:slug]}/edit"
        else
        @recipe = Recipe.find_by_slug(params[:slug])
          if current_user == @recipe.user
            @recipe.update(name: params[:name].capitalize, ingredients: params[:ingredients], instructions: params[:instructions])
            flash[:message] = "You have updated your #{@recipe.name} recipe."
            redirect to "/recipes"
          else
            flash[:message] = "Sorry can only edit your own recipes."
            redirect to "/recipes"
          end
        end
      end
    end

end
