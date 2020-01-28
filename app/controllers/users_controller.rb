class UsersController < ApplicationController

# render login form
 get "/login" do
   if logged_in?
     redirect to '/users/index'
   else
     erb :'users/login'
   end
 end

 # recieve the data (params) from the login form
 post "/login" do
   # find the user
   @current_user = User.find_by(:username => params[:username])
   # authenticate the user
   if @current_user && @current_user.authenticate(params[:password])
     # creating a key/value pair in the session hash using the users id to actually log them in
     session[:user_id] = @current_user.id
     # add a success message to the flash hash
     flash[:message] = "Welcome back #{user.username}"
     # redirect user's profile (users show)
     redirect to '/sneakers'
   else
     # show an error message
     flash[:error] = "Your credentials were invalid. Try again!"
     # redirecting back to the login page
     # this is where my error message with will display (at the login route)
     redirect to '/login'
   end
 end

 # users SHOW route
 get "/users/:id" do
   # find the user
   @user = User.find_by(id: params[:id])
   erb :'/users/show'
 end

 # SIGN UP
 # get sign up route that renders signup form
 get '/signup' do
   #render my sign form
   erb :'/users/signup'
 end

 post '/signup' do
   if params[:username] != "" && params[:password] != "" && params[:email] != "" && params[:bio] != "" && params[:image_url] != ""
     @new_user = User.new(:username => params[:username], :password => params[:password], :email => params[:email], :bio => params[:bio], :image_url => params[:image_url])
     @new_user.save
     session[:user_id] = @new_user.id
     redirect to '/users/index'
   else
     redirect to '/signup'
   end
 end

 get '/users/index'

  if logged_in?
    @sneakers = Sneaker.all
    erb :'/users/index'
  else
    redirect to '/login'
  end
 end

 # post sign up route that recieve input data from user, create the user, and logs user in
 # post '/users' do
 #   # will eventually need to add validations to confirm all inputs are filled out before creating user
 #   @user = User.create(params)
 #   # post sign up route to create user using params and add key/value pair to sessions hash
 #   session[:user_id] = @user.id
 #   # redirect to user profile
 #   redirect "/users/#{@user.id}"
 # end

 # LOG OUT
 # get logout that clears the session hash
 get '/logout' do
   #binding.pry
   session.clear
   #binding.pry
   # redirect to home/landing page
   redirect '/'
 end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/#{@user.slug}"
  end

end
