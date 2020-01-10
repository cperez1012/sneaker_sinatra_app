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

  get '/sneakers/:id' do
    @sneaker = Sneaker.find(params[:id])
    # binding.pry
    @user = User.find(@sneaker.user_id)
    erb :"sneakers/show"
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

  post '/sneakers' do
    # binding.pry
    @sneaker = Sneaker.new(params[:sneaker])
    # binding.pry
    @sneaker.user_id = current_user.id
    if @sneaker.save
      flash[:message] = "Sneaker saved successfully!"
      redirect to "/sneakers/#{@sneaker.id}"
    else
      flash[:error] = "Sneaker Creation Failed"
      redirect '/sneakers/new'
    end
  end

  get '/sneakers/:slug/edit' do
   @sneakers = Sneaker.all
   @sneaker = Song.find_by_slug(params[:slug])
   erb :'sneakers/edit'
 end

  patch '/sneakers/:id' do
    @sneaker = Sneaker.find(params[:id])
    @sneaker.update(name: params[:name], category: params[:category], description: params[:description], image_url: params[:image_url])
    redirect to "/sneakers/#{@sneakers.id}"
  end

end
