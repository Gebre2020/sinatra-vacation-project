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
    get_package
    # restieve the requested package
    # show details of that package
    erb :'/packages/show'
  end

  post '/packages' do 
    # create the new package
    # redirect our user somewhere/show route/
    
    #  @package = Package.new(package_name: params[:package_name], budget: params[:budget])
    #  @package = Package.new(params)
    #  @package.save

    @package = Package.new(params)
    @package.user_id = session[:user_id]
    @package.save
    
    # @package = Package.create(params)
    redirect "/packages/#{@package.id}"

  end

  # our user just requested to see an edit form for a package
  get '/packages/:id/edit' do  
    get_package
    redirect_if_not_authorized
    erb :"/packages/edit"
    # if @package.user == current_user
    # else
    #   flash[:error] = "You are not the owner"
    #   redirect '/packages'
    # end
  # retreive the object 
  # autofill a form with the details of that object
  # render to our user to fill out
  end

  #user just submitted the edit form
  patch '/packages/:id' do  # put '/packages/:id' do
    get_package
    #binding.pry
    redirect_if_not_authorized
    @package.update(package_name: params[:package_name], budget: params[:budget])
    redirect "/packages/#{@package.id}"
    # if @package.user == current_user
    # else
    #   flash[:error] = "You can't make this edit, you don,t own this"
    #   redirect '/packages'
    # end
  end

  delete '/packages/:id' do 
    get_package
    @package.destroy
    redirect '/packages'   # to the index page
    # no view
  end

  private

    def get_package
      @package = Package.find_by(id:params[:id])
    end

    def redirect_if_not_authorized
      if @package.user != current_user
        flash[:error] = "You can't make this edit, you don't own this"
        redirect '/packages'
      end
    end

end