class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      @user = current_user
      redirect to "/users/#{@user.slug}"
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      puts "User successfully saved"
      flash[:message] = "Welcome, #{user.username}!"
      session[:user_id] = @user.id

      redirect to "/users/#{@user.slug}"
    elsif User.find_by(email: params[:email])
      puts "Signup email is already taken"
      flash[:error] = "Signup email is already taken"
      redirect to '/signup'
    elsif User.find_by_slug(@user.slug)
      puts "Username is already taken"
      flash[:error] = "Username is already taken"
      redirect to '/signup'
    else
      puts "Your credentials were invalid. Try again!"
      flash[:error] = "Your credentials were invalid. Try again!"
      redirect to '/signup'
    end
  end


  #render a login form
  get "/login" do
    if logged_in?
      redirect to "/users/#{@current_user.slug}"
    else
      erb :'users/login'
    end
  end

  #receive data from the login form (params)
  post "/login" do
    #find the user
    @user = User.find_by(username: params[:username])
    #authenticate the user
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome back #{@user.username}"
    #log them in
    #redirect to user's profile (user's show)
      redirect to "/users/#{current_user.slug}"
    else
      flash[:error] = "Your credentials were invalid. Try again!"
      redirect '/login'
    end
  end

    #users SHOW route
    get "/users/:id" do
      #find the user
      @user = User.find_by(id: params[:id])
      erb :'/users/signup'
    end

    post '/users' do
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end

    #log out
    #get logout that clears the session hash
    get '/logout' do

      session.clear if logged_in?
      redirect '/'
    end

    get '/users/' do
      if logged_in? && current_user
        erb :'users/show'
      else
        redirect to '/'
      end
    end

    post '/users' do
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end


    get '/users/:slug' do
      if logged_in? && current_user.slug == params[:slug]
        @user = User.find_by_slug(@user.slug)
        erb :'users/show'
      else
        flash[:error] = "User not found!"
        redirect to "/"
      end
    end

end
