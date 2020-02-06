require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "cowabunga"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
       @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      #  binding.pry
    end

    def authorized_to_edit?
      @sneaker = Sneaker.find_by_id(params[:id])
      current_user.id == @sneaker.user_id
    end
  end
end
