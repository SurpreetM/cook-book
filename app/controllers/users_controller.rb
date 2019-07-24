class UserController < ApplicationController

  get "/signup" do
    erb :"users/create_user"
  end


  post "/signup" do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Please ensure all the fields are populated."
      erb :"users/create_user"
    else
      if !User.find_by(:email => params[:email])
      user = User.create(params)
      session[:user_id] = user.id
      redirect to "/recipes"
      else
        flash[:message] = "You already have an account"
        erb :"users/login"
      end
    end
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/recipes"
    else
      redirect to "/"
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
