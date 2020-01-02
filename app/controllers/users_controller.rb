class UsersController < ApplicationController
#
#   get '/signup' do
#     if logged_in?
#       @user = current_user
#       redirect to "/users/#{@user.slug}"
#     else
#       erb :'users/signup'
#     end
#   end
#
#   post '/signup' do
#     @user = User.new(params)
#     if @user.save
#       puts "User successfully saved"
#       flash[:message] = "Welcome, #{user.username}!"
#       session[:user_id] = @user.id
#
#       redirect to "/users/#{@user.slug}"
#     elsif User.find_by(email: params[:email])
#       puts "Signup email is already taken"
#       flash[:error] = "Signup email is already taken"
#       redirect to '/signup'
#     elsif User.find_by_slug(@user.slug)
#       puts "Username is already taken"
#       flash[:error] = "Username is already taken"
#       redirect to '/signup'
#     else
#       puts "Your credentials were invalid. Try again!"
#       flash[:error] = "Your credentials were invalid. Try again!"
#       redirect to '/signup'
#     end
#   end
#
#
#   #render a login form
#   get "/login" do
#     if logged_in?
#       redirect to "/users/#{@current_user.slug}"
#     else
#       erb :'users/login'
#     end
#   end
#
#   #receive data from the login form (params)
#   post "/login" do
#     #find the user
#     @user = User.find_by(username: params[:username])
#     #authenticate the user
#     if @user && @user.authenticate(params[:password])
#       session[:user_id] = @user.id
#       flash[:message] = "Welcome back #{@user.username}"
#     #log them in
#     #redirect to user's profile (user's show)
#       redirect to "/users/#{current_user.slug}"
#     else
#       flash[:error] = "Your credentials were invalid. Try again!"
#       redirect '/login'
#     end
#   end
#
#     #users SHOW route
#     get "/users/:id" do
#       #find the user
#       @user = User.find_by(id: params[:id])
#       erb :'/users/signup'
#     end
#
#     post '/users' do
#       @user = User.create(params)
#       session[:user_id] = @user.id
#       redirect "/users/#{@user.id}"
#     end
#
#     #log out
#     #get logout that clears the session hash
#     get '/logout' do
#
#       session.clear if logged_in?
#       redirect '/'
#     end
#
#     get '/users/' do
#       if logged_in? && current_user
#         erb :'users/show'
#       else
#         redirect to '/'
#       end
#     end
#
#     post '/users' do
#       @user = User.create(params)
#       session[:user_id] = @user.id
#       redirect "/users/#{@user.id}"
#     end
#
#
#     get '/users/:slug' do
#       if logged_in? && current_user.slug == params[:slug]
#         @user = User.find_by_slug(@user.slug)
#         erb :'users/show'
#       else
#         flash[:error] = "User not found!"
#         redirect to "/"
#       end
#     end
#
# end
# render login form
 get "/login" do
   erb :'users/login'
 end

 # recieve the data (params) from the login form
 post "/login" do
   # find the user
   user = User.find_by(username: params[:username])
   # authenticate the user
   if user && user.authenticate(params[:password])
     # creating a key/value pair in the session hash using the users id to actually log them in
     session[:user_id] = user.id
     # add a success message to the flash hash
     flash[:message] = "Welcome back #{user.username}"
     # redirect user's profile (users show)
     redirect "/users/#{user.id}"
   else
     # show an error message
     flash[:error] = "Your credentials were invalid. Try again!"
     # redirecting back to the login page
     # this is where my error message with will display (at the login route)
     redirect '/login'
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

 # post sign up route that recieve input data from user, create the user, and logs user in
 post '/users' do
   # will eventually need to add validations to confirm all inputs are filled out before creating user
   @user = User.create(params)
   # post sign up route to create user using params and add key/value pair to sessions hash
   session[:user_id] = @user.id
   # redirect to user profile
   redirect "/users/#{@user.id}"
 end

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
       if logged_in? && current_user.slug == params[:slug]
         user = User.find_by_slug(user.slug)
         erb :'users/show'
       else
         flash[:error] = "User not found!"
         redirect to "/"
       end
     end

end
