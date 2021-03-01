class PackagesController < ApplicationController

  # all routes pertaining to package model
  # <%= %> = interpolates ruby code in views
  #         = what our user sees
  # <% %> = what our views process

  # our user just requested all packages
  # index route
  get '/packages' do
     # "welcome"
    @packages = Package.all
    erb :'packages/index'
  end

  # user just made a request to view form to add a new package
  get '/packages/new' do
    erb :'/packages/new'
  end

  # our user wants to see details of one package
  # show route
  get '/packages/:id' do 
    # binding.pry
    get_post
    # restieve the requested package
    # show details of that package
    erb :'/packages/show'
  end

  post '/packages' do 
    # create the new package
    # redirect our user somewhere/show route/
    
    # binding.pry
    #  @package = Package.new(package_name: params[:package_name], budget: params[:budget])
    #  @package = Package.new(params)
    #  @package.save
    @package = Package.create(params)
    redirect "/packages/#{@package.id}"

    # @package.user_id = session[:user_id]
    # @package = Package.new(params)
    # @package.save
  end

  # our user just requested to see an edit form for a package
  get '/packages/:id/edit' do 
    get_post
    erb :"/packages/edit"
  # retreive the object 
  # autofill a form with the details of that object
  # render to our user to fill out
  end

  #user just submitted the edit form
  patch '/packages/:id' do  # put '/packages/:id' do
    get_post
    #binding.pry
    @package.update(package_name: params[:package_name], budget: params[:budget])
    redirect "/packages/#{@package.id}"
  end

  delete '/packages/:id' do 
    get_post
    @package.destroy
    redirect '/packages'   # to the index page
    # no view
  end

  helpers do

    def get_post
      @package = Package.find_by(id:params[:id])
    end

  end


end