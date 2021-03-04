class UserController < ApplicationController

    # responsible for anything involving our user
    # displays a signup form
    
    #sign up  '/signup' new => creating an user object
    get '/signup' do # render signup form
        # "this is the signup route"
        erb :'/users/signup'
    end

    post '/signup' do
        #binding.pry
        # receive data from the form inside of params hash
        # create a new user object with the data
        user = User.new(params)
        # validate our user object     
        if params["username"].blank? || params["password"].blank?
         flash[:error] = "Username and password can't be blank"
          erb :"/users/signup"
        elsif User.find_by(username: user.username)
            flash[:error]  = "Account with that username already exists "
          redirect '/login'
        else 
          user.save
          session[:user_id] = user.id 
          redirect '/'
        end     
        # if our user is valid
           # persist the new object
        # else
           # redirect them back to signup page
        # user must use unique data/ put a message this data is already exiting
    end

    #login  '/login' read => querying our user and reading user attribute
    get '/login' do  # render the login form        
        erb :"/users/login"
    end

    post '/login' do
        # gather data from the form => params
        # find my user object
        if params["username"].empty? || params["password"].empty?
            flash[:error] = "Username and password can't be blank"
            erb :"/users/login."
        elsif
          user = User.find_by_username(params[:username])
        # binding.pry
        # if user exists && password is correct
        if user && user.authenticate(params[:password])
          # login user
            session[:user_id] = user.id
          # redirect
            redirect '/packages'
          else
            flash[:error] = "Invalid login"
            # invalid login
            redirect '/login'
          end
        end
    end

    #logout  '/logout' delete => clears our session
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
