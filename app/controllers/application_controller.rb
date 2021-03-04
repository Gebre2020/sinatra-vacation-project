require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
    register Sinatra::Flash
  end

  # define general routes
  # any route/request that doesn't involve
  get "/" do
    # "Hello World!!"
     erb :welcome
  end
  
  # about route
  # contant page
  # a route that retreives packages


  helpers do  # makes these methods available to controller and views

    # return the logged in user
    def current_user  # return logged in user
      @current_user ||= User.find_by_id(session[:user_id])  # memoization
    end

    # check if a user logged in and return will be a true or false value
    def logged_in?
      !!session[:user_id]
    end

    def logout
      session.clear
    end

  end
 
end
