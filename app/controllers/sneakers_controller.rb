class SneakersController < ApplicationController

#CRUD
  get '/sneakers' do
    @sneakers = Sneaker.all
    erb :'sneakers/index'
  end

  get '/sneakers/new' do
    if logged_in?
      erb :'sneakers/new'
    else
      flash[:error] = "You mudt be logged in to do that"
      redirect to '/'
    end
  end

  post '/sneakers/new' do
    if logged_in? && params[:name] != "" && params[:image_url] != "" && params[:description] != "" && params[:category] != ""
      @new_sneaker = Sneaker.create(params)
      @sneaker_slug = "#{@new_sneaker.name} #{@new_sneaker.image_url} #{@new_sneaker.description} #{@new_sneaker.category}".downcase.gsub('','+')
      @new_sneaker.user_id = current_user.id
      @new_sneaker.save
      redirect to '/users/show'
    else
      redirect to '/users/show'
    end
  end

  get '/sneakers/:id' do
    @sneakers = Sneaker.find(params[:id])
    erb :'/sneakers/show'
  end

  get '/sneakers/:id/edit' do
    @sneaker = Sneaker.find(params[:id])
    if authorized_to_edit?(@sneaker)
      erb :'sneakers/edit'
    else
      flash[:error] = "Not authorized to edit!"
      redirect to '/sneakers'
    end
  end

  patch '/sneakers/:id' do
    @sneaker = Sneaker.find(params[:id])
    @sneaker.update(name: params[:name], category: params[:category], description: params[:description], image_url: params[:image_url])
    redirect to "/sneakers/#{@sneakers.id}"
  end

  get '/sneakers/:id/delete' do
    @sneaker = Sneaker.find(params[:id])
    @sneaker.delete
    redirect to '/sneakers'
  end

 #  get '/sneakers/:user_id' do
 #    #id from params is current user id
 #    # @sneaker = Sneaker.find(params[:user_id])
 #    # binding.pry
 #    @user = User.find(params[:user_id])
 #    erb :"sneakers/show"
 #  end
 #
 #  post '/sneakers' do
 #    # binding.pry
 #    @sneaker = Sneaker.new(params[:sneaker])
 #    # binding.pry
 #    @sneaker.user_id = current_user.id
 #    if @sneaker.save
 #      flash[:message] = "Sneaker saved successfully!"
 #      redirect to "/sneakers/#{@sneaker.id}"
 #    else
 #      flash[:error] = "Sneaker Creation Failed"
 #      redirect '/sneakers/new'
 #    end
 #  end
 #
 #  get '/sneakers/:slug/edit' do
 #   @sneakers = Sneaker.all
 #   @sneaker = Song.find_by_slug(params[:slug])
 #   erb :'sneakers/edit'
 # end

end
