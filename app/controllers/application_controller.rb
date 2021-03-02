require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secrect, 'secret'
    register Sinatra::Flash
  end

  # define general routes
  # any route/request that doesn't involve
  get "/" do
    # binding.pry
    # "Hello World!!"
     erb :welcome
  end
  
  #about route
  # contant page
  # a route that retreives posts
  
  # logout 'logout' delete => clears our session
  get '/logout' do
    session.clear
    redirect '/login'
  end

  helpers do  # makes these methods available to controller and views

    # return the logged in user
    def current_user  # return logged in user
      @current_user ||= User.find_by_id(session[:user_id])  # memoization
    end

    # check if a user logged in
    def lodded_in?
      !!session[:user_id]
    end
    
  end
 
end
