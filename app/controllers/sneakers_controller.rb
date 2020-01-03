class SneakersController < ApplicationController

#CRUD
  get '/sneakers' do
    @sneakers = Sneakers.all
    erb :'sneakers/index'
  end

  # get '/sneakers/new' do
  #   if logged_in?
  #     erb :'sneakers/new'
  #   else
  #     flash[:error] = "You mudt be logged in to do that"
  #     redirect to '/'
  #   end
  # end

  post '/sneakers' do
    sneaker = Sneaker.new(params)
    if sneaker.save
      flash[:message] = "Sneaker saved successfully!"
      redirect to "/sneakers/#{sneaker.id}"
    else
      flash[:error] = "Sneaker Creation Failed"
      redirect 'sneakers/new'
    end
  end

  get '/sneakers/:id' do
    @sneaker = Sneaker.find(params[:id])
    erb :"sneakers/show"
  end

  get '/sneakers/:id/edit' do
    @sneaker = sneaker.find(params[:id])
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

end
