class PackagesController < ApplicationController
 
  get '/packages' do   
    if @packages = current_user
      @packages = Package.all
      erb :'packages/index'
    else
      flash[:error] = "You are not login, please signup or login"
      redirect '/'
    end
  end

  get '/packages/new' do  
    if @packages = current_user
      @packages = Package.all
      erb :'packages/new'
    else
      flash[:error] = "You are not login, please signup or login!"
      redirect '/'
    end
  end
  
  get '/packages/:id' do   
    if get_package != nil
      erb :'/packages/show'
    else
      erb :'/error'
    end
  end

  post '/packages' do 
    @package = Package.new(params)
    @package.user_id = session[:user_id]
    if params[:package_name].blank? || params[:budget].blank?
      flash[:error] = " Write Package name or Budget, can not be blank!"
      redirect '/packages/new'
    else
      @package.save
      redirect "/packages/#{@package.id}"
    end
  end

  get '/packages/:id/edit' do  
    get_package
    redirect_if_not_authorized
    erb :"/packages/edit"
  end

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
