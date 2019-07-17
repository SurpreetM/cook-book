class UserController < ApplicationController

  get "/signup" do
    erb :"users/create_user"
  end


  post "/signup" do
    @user = User.create(params)
    erb :"/recipes/recipes"
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    @user = User.find_by(:name => params[:name])
    if @user && @user.authenticate(params[:password])
      erb :"/recipes/recipes"
    else
      redirect to "/"
    end
  end

end
