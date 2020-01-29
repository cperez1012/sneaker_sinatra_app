class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  get '/users/show' do

   if logged_in?
     @sneakers = Sneaker.all
     erb :'/users/show'
   else
     redirect to '/login'
   end
  end

  post '/signup' do
    if params[:username] != "" && params[:password] != "" && params[:email] != "" && params[:bio] != "" && params[:image_url] != ""
      @new_user = User.new(:username => params[:username], :password => params[:password], :email => params[:email], :bio => params[:bio], :image_url => params[:image_url])
      @new_user.save
      session[:user_id] = @new_user.id
      redirect to '/users/show'
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
    @current_user = User.find_by(:username => params[:username])
    if @current_user && @current_user.authenticate(params[:password])
     session[:user_id] = @current_user.id
     flash[:message] = "Welcome back #{@current_user.username}"
     redirect to '/sneakers'
    else
     flash[:error] = "Your credentials were invalid. Try again!"
     redirect to '/login'
    end
  end

 get '/logout' do
   session.clear
   redirect '/'
 end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/#{@user.slug}"
  end
end
