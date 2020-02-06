class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  get '/users/show' do
   if logged_in?
     erb :'/users/show'
   else
     redirect to '/login'
   end
  end

  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id
    # binding.pry
    if !session[:user_id].nil?
      flash[:message] = 'User account created!'
      erb :'/users/show'
    end
    if params[:password] != params[:password_confirmation]
      flash[:error] = 'Passwords do not match!'
      redirect to '/signup'
    elsif
      flash[:error] = 'Username and/or email already in use!'
      redirect to '/signup'
    else
      redirect to '/signup'
    end
  end

  get "/login" do
    if logged_in?
     redirect to '/users/show'
    else
     erb :'users/login'
    end
  end

  post "/login" do
    current_user = User.find_by(:username => params[:username])
    if current_user && current_user.authenticate(params[:password])
     session[:user_id] = current_user.id
     flash[:message] = "Welcome back #{current_user.username}"
     redirect to "/users/#{current_user.id}"
    else
     flash[:error] = "Your credentials were invalid. Try again!"
     redirect to '/login'
    end
  end

 get '/logout' do
   session.clear
   redirect '/'
 end

 get "/users/:id" do
   @user = User.find_by(id: params[:id])
   erb :'/users/show'
 end
end
