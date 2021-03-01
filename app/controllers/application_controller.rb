require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secrect, 'secret'
  end

  # define general routes
  # any route/request that doesn't involve
  get "/" do
    # "Hello World!!"
     erb :welcome
  end
  
  #about route
  # contant page
  # a route that retreives posts
  
end
