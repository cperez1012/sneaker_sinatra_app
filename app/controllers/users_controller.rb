class UsersController < ApplicationController

  #render a login form
  get "/login" do
    erb :'users/login'
  end

  #receive data from the login form (params)
  post "/login" do
    #find the user
    user = User.find_by(email: params[:email])
    #authenticate the user
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back #{user.name}"
    #log them in
    #redirect to user's profile (user's show)
      redirect "/users/#{user.id}"
    else
      flash[:error] = "Your credentials were invalid. Try again!"
      redirect '/login'
    end
  end

end
