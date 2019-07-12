require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :homepage
  end

#MOVE to a Users application controller and don't forget to mount
  get "/signup" do
    erb :"users/signup"
  end

  post "/signup" do
    @user = User.create(params)
    erb :test
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
      redirect to "/recipes"
    else
      redirect to "/"
    end
  end

  get "/recipes" do
    erb :recipes
  end

end
