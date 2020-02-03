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
      flash[:error] = "You must be logged in to do that"
      redirect to '/'
    end
  end

  post '/sneakers/new' do
    if logged_in? && params[:name] != "" && params[:image_url] != "" && params[:description] != "" && params[:category] != ""
      @sneaker = Sneaker.create(:name => params[:name], :category => params[:category], :description => params[:description], :image_url => params[:image_url])
      @sneaker_slug = "#{@sneaker.name} #{@sneaker.image_url} #{@sneaker.description} #{@sneaker.category}".downcase.gsub('','+')
      @sneaker.user_id = current_user.id
      @sneaker.save
      binding.pry
      redirect to '/sneakers/show'
    else
      redirect to '/users/show'
    end
  end

  post '/sneakers' do
    if logged_in? && params[:name] != "" && params[:image_url] != "" && params[:description] != "" && params[:category] != ""
      @sneaker = Sneaker.create(:name => params[:name], :category => params[:category], :description => params[:description], :image_url => params[:image_url])
      # @sneaker_slug = "#{@sneaker.name} #{@sneaker.image_url} #{@sneaker.description} #{@sneaker.category}".downcase.gsub('','+')
      @sneaker.user_id = current_user.id
      @sneaker.save
      binding.pry
      redirect to '/sneakers/show'
    else
      redirect to '/users/show'
    end
  end

  # put '/sneakers/:id' do
  #   @sneaker = Sneaker.find(params[:id])
  #   @sneaker.update(params)
  #   erb :'sneakers/index'
  # end

  get '/sneakers/:id' do
    binding.pry
    @sneaker = Sneaker.find_by(params[:id])
    erb :'/sneakers/show'
  end

  get '/sneakers/:id/edit' do
    @sneaker = Sneaker.find_by(params[:id])
    erb :'/sneakers/edit'
  end

  patch '/sneakers/:id' do
    @sneaker = Sneaker.find(params[:id])
    if params[:name] != "" && params[:category] != "" && params[:description] != "" && params[:image_url] != ""
      @sneaker.update(:name => params[:name], :category => params[:category], :description => params[:description], :image_url => params[:image_url])
    end
      @sneaker_slug = "#{@sneaker.name} #{@sneaker.image_url} #{@sneaker.description} #{@sneaker.category}".downcase.gsub('')
      @sneaker.user_id = current_user.id
      @sneaker.save
    redirect to "/sneakers/#{@sneaker.id}"
  end

  get '/sneakers/:id/delete' do
    @sneaker = Sneaker.find_by(params[:id])
    @sneaker.delete
    redirect to '/sneakers'
  end

end
