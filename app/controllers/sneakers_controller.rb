class SneakersController < ApplicationController

  get '/sneakers' do
    if logged_in?
      @sneakers = current_user.sneakers
      erb :'sneakers/index'
    else
      redirect to '/'
    end
  end

  get '/sneakers/new' do
    if logged_in?
      erb :'sneakers/new'
    else
      flash[:error] = "You must be logged in to do that"
      redirect to '/'
    end
  end

  post '/sneakers' do
    if logged_in?
      @sneaker = current_user.sneakers.build(:name => params[:name], :category => params[:category], :description => params[:description], :image_url => params[:image_url])
        if @sneaker.save
          redirect to "/sneakers/#{@sneaker.id}"
        else
          redirect to '/sneakers/new'
      end
    else
      redirect to '/'
    end
  end

  get '/sneakers/:id' do
    @sneaker = Sneaker.find_by_id(params[:id])
    erb :'/sneakers/show'
  end

  get '/sneakers/:id/edit' do  #load edit form
    if logged_in? && authorized_to_edit?
      # @sneaker = Sneaker.find_by_id(params[:id])
        erb :'/sneakers/edit'
    else
      redirect to '/login'
    end
  end

  patch '/sneakers/:id' do #edit action
    @sneaker = Sneaker.find_by_id(params[:id])
    @sneaker.name = params[:name]
    @sneaker.category = params[:category]
    @sneaker.description = params[:description]
    @sneaker.image_url = params[:image_url]
    # @sneaker.user_id = params[:user_id]
    # binding.pry
    @sneaker.save
    redirect to "/sneakers/#{@sneaker.id}"
  end

  get '/sneakers/:id/delete' do #delete action
    @sneaker = Sneaker.find_by_id(params[:id])
    @sneaker.delete
    redirect to '/sneakers'
  end
end
