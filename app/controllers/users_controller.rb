class UserController < ApplicationController

  get "/signup" do
    erb :"users/create_user"
  end


  post "/signup" do
    user = User.create(params)
    session[:user_id] = user.id
    redirect to "/recipes"
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/recipes"
    else
      redirect to "/"
    end
  end

end
