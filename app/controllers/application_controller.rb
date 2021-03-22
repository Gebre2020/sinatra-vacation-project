require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
    register Sinatra::Flash
    set :show_exceptions, false
  end

  not_found do
    erb :error
  end

  get "/" do
    erb :welcome
  end
  
  error ActiveRecord::RecordNotFound do
    redirect '/'
  end

  helpers do 
    def current_user  
      @current_user ||= User.find_by_id(session[:user_id])  # memoization
    end

    def logged_in?
      !!session[:user_id]
    end

    def logout
      session.clear
    end

  end
 
end
