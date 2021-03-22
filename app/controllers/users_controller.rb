class UserController < ApplicationController

    get '/signup' do 
      erb :'/users/signup'
    end

    post '/signup' do
      user = User.new(params)    
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

    get '/login' do         
      erb :"/users/login"
    end

    post '/login' do 
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/packages'
      else
        flash[:error] = "Invalid username or password login, please login with the correct input!!"
        redirect '/login'
      end
    end

    delete '/logout' do
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
