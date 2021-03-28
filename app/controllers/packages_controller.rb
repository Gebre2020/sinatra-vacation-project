class PackagesController < ApplicationController
 
  get '/packages' do    # Index Route
    if  current_user
     # @packages = Package.all

      @packages = current_user.packages  
      erb :'packages/index'
    else
      flash[:error] = "You are not login, please signup or login"
      redirect '/'
    end
  end

  get '/packages/new' do   # request a view form to add a new object/ new route
    if current_user
      erb :'packages/new'
    else
      flash[:error] = "You are not login, please signup or login!"
      redirect '/'
    end
  end
  
  get '/packages/:id' do   # READ / show route/ renders one instance
    if get_package != nil && @package.user_id == session[:user_id]
      erb :'/packages/show'
    else
      erb :'/error'
    end
  end

  post '/packages' do   # create a new object
    @package = Package.new(params)
    @package.user_id = session[:user_id]
    if params[:package_name].blank? || params[:budget].blank?
      flash[:error] = " Write Package name or Budget, can not be blank!"
      redirect '/packages/new'
    else
      @package.save
      redirect "/packages/#{@package.id}"   # redirect to show route
    end
  end

  # UPDATE
  get '/packages/:id/edit' do   # request to see an edit form for an object
    get_package
    redirect_if_not_authorized
    erb :"/packages/edit"
  end

  # submitted the edit form 
  patch '/packages/:id' do  # put '/packages/:id' do
    get_package
    redirect_if_not_authorized
    @package.update(package_name: params[:package_name], budget: params[:budget])
    redirect "/packages/#{@package.id}"
  end

  delete '/packages/:id' do 
    get_package
    redirect_if_not_authorized
    @package.destroy
    redirect '/packages'
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
