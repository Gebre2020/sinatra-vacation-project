class UserController < ApplicationController

    # creating a new user object
    get '/signup' do   # render signup form
      # erb :'/users/signup'
      if current_user
        @packages = current_user.packages 
        erb :'/packages/index'
      else
        erb :"/users/signup"
      end
    end

    post '/signup' do
      # proceses/creates a new user object with the data
      user = User.new(params)   
       # validate our user object
      if params["name"].blank? || params["username"].blank? || params["email"].blank? || params["password"].blank?
        flash[:error] = "Username and password can not be blank, please signup again!"
        redirect '/signup'
      elsif User.find_by(username: user.username)
        flash[:error]  = "Account with that username already exist, please change username or login! "
        redirect '/login'
      else 
        user.save
        session[:user_id] = user.id   # *** logging user in ***
        redirect '/login'
      end     
    end

    get '/login' do     # render the login form
      # erb :"/users/login"
      if current_user
        @packages = current_user.packages 
        erb :'/packages/index'
      else
        erb :"/users/login"
      end
    end

    post '/login' do 
      # gather data from the form => params
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id    # user logging in
        redirect '/packages'
      else
        flash[:error] = "Invalid username or password login, please login with the correct input!!"
        redirect '/login'
      end
    end

    delete '/logout' do  # '/logout' delete => clears our session
      if session[:user_id] != nil
        session.destroy
        redirect '/'
      else
        redirect '/packages'
      end
    end

    get '/logout' do
      logout
      redirect '/'
    end
end
