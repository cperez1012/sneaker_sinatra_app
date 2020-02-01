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
      redirect to '/sneakers/show'
    else
      redirect to '/users/show'
    end
  end
  #
  # post '/sneakers' do
  #   # # if logged_in? && params[:name] != "" && params[:image_url] != "" && params[:description] != "" && params[:category] != ""
  #   #   @sneaker = Sneaker.create(params)
  #   # #   @sneaker_slug = "#{@new_sneaker.name} #{@new_sneaker.image_url} #{@new_sneaker.description} #{@new_sneaker.category}".downcase.gsub('','+')
  #   #   @sneaker.user_id = current_user.id
  #   #   @sneaker.save
  #     redirect to '/sneakers/show'
  #   # else
  #   #   redirect to '/users/show'
  #   # end
  # end

  get '/sneakers/:id' do
    @sneaker = Sneaker.find(params[:id])
    erb :'sneakers/show'
  end

  # post '/sneakers/:id' do
  #   @sneaker = Sneaker.find(params[:id])
  #   erb :'/sneakers/show'
  # end

  get '/sneakers/:id/edit' do
    @sneaker = Sneaker.find(params[:id])
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
    @sneaker = Sneaker.find(params[:id])
    @sneaker.destroy
    redirect to '/sneakers'
  end

end
