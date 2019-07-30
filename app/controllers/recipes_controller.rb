class RecipeController < ApplicationController

    get "/recipes" do
      redirect_if_not_logged_in
      erb :"recipes/recipes"
    end

    get "/recipes/new" do
      redirect_if_not_logged_in
      erb :"recipes/create_recipe"
    end

    post "/recipes" do
      redirect_if_not_logged_in
      if params[:name] == "" || params[:ingredients] == "" || params[:instructions] == ""
        flash[:message] = "Please ensure all the fields are populated."
        redirect to "/recipes/new"
      else
        recipe = current_user.recipes.create(name: params[:name].capitalize, ingredients: params[:ingredients], instructions: params[:instructions])
        flash[:message] = "You have successfully added this new recipe."
        redirect to "/recipes/#{recipe.slug}"
        end
    end

    get "/recipes/:slug" do
      redirect_if_not_logged_in
      @recipe = Recipe.find_by_slug(params[:slug])
      erb :"recipes/show"
    end

    get "/recipes/:slug/edit" do
      redirect_if_not_logged_in
      @recipe = Recipe.find_by_slug(params[:slug])
        if current_user == @recipe.user
          erb :"recipes/edit"
        else
          flash[:message] = "Sorry can only edit your own recipes."
          redirect to "/recipes/#{@recipe.slug}"
        end
    end

    delete "/recipes/:slug/delete" do
      redirect_if_not_logged_in
        recipe = Recipe.find_by_slug(params[:slug])
        if current_user == recipe.user
          flash[:message] = "You have deleted your #{recipe.name} recipe."
          recipe.delete
          redirect to "/recipes"
        else
          flash[:message] = "Sorry you can only delete your own recipes."
          redirect to "/recipes"
        end
    end

    patch "/recipes/:slug/edit" do
      redirect_if_not_logged_in
        if params[:name] == "" || params[:ingredients] == "" || params[:instructions] == ""
          flash[:message] = "Please ensure all the fields are populated."
          redirect to "/recipes/#{params[:slug]}/edit"
        else
        recipe = Recipe.find_by_slug(params[:slug])
          if current_user == recipe.user
            recipe.update(name: params[:name].capitalize, ingredients: params[:ingredients], instructions: params[:instructions])
            flash[:message] = "You have updated your #{recipe.name} recipe."
            redirect to "/recipes/#{recipe.slug}"
          else
            flash[:message] = "Sorry can only edit your own recipes."
            redirect to "/recipes/#{recipe.slug}"
          end
        end
    end

end
