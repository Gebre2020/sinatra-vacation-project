class PackagesController < ApplicationController
 
  # INDEX ROUTE
  # Create a route that returns all the packages

  get '/packages' do
     # "welcome"
     
    if @packages = current_user
      @packages = Package.all
      erb :'packages/index'
    else
      flash[:error] = "You are not login, please signup or login"
      redirect '/'
    end
  end

  # CREATE
  # user just made a request to view form to add a new package
  get '/packages/new' do  
    # erb :'/packages/new'

    if @packages = current_user
      @packages = Package.all
      erb :'packages/new'
    else
      flash[:error] = "You are not login, please signup or login!"
      redirect '/'
    end
  end
  
  # READ
  # our user wants to see details of one package
  # show route
  get '/packages/:id' do   
    if get_package != nil
    # retrieve the requested package
    # show details of that package
      erb :'/packages/show'
    else
      erb :'/error'
    end
  end

  post '/packages' do 
    # create the new package
    # redirect our user somewhere/show route/
    
    #  @package = Package.new(package_name: params[:package_name], budget: params[:budget])
    #  @package = Package.new(params)
    #  @package.save

    @package = Package.new(params)
    @package.user_id = session[:user_id]
    if params[:package_name].blank? || params[:budget].blank?
      flash[:error] = " Write Package name or Budget, can not be blank!"
      redirect '/packages/new'
    else
      @package.save
      # @package = Package.create(params)
      redirect "/packages/#{@package.id}"
      #redirect '/packages'
    end
  end

  # UPDATE
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

  # DELETE
  delete '/packages/:id/delete' do 
    # @packages = Packages.find_by(user_id: current_user.id, package_id: params["id"])
    get_package
    redirect_if_not_authorized
    get_package.delete
    # @package.destroy(params[:id])
    #redirect "/users/#{current_user.id}/edit"
    redirect to '/packages'
  end 


  private

    def get_package
      @package = Package.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
      if @package.user != current_user
        flash[:error] = "You can't make this edit/delete!!"
        redirect '/packages'
      end
    end

end
