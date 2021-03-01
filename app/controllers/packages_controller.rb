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
    @package = Package.find(params[:id])
    # restieve the requested package
    # show details of that package
    erb :'/packages/show'
  end

  post '/packages' do 
    # binding.pry
    # create the new package
    # redirect our user somewhere/show route/

    @package = Package.new(params)
    @package.user_id = session[:user_id]
    @package.save
  end

  # our user just requested to see an edit form for a package
  get '/packages/:id/edit' do 
    @package = Package.find(params[:id])
  # retreive the object 
  # autofill a form with the details of that object
  # render to our user to fill out
  end

  #user just submitted the edit form
  patch '/packages/:id' do  # put '/packages/:id' do
    @package = Package.find(params[:id])
  end

  delete '/packages/:id' do 
    @package = Package.find(params[:id])
    @package.destroy
    redirect '/packages'   # to the index page
    # no view
end


end