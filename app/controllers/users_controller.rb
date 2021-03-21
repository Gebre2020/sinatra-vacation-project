class UserController < ApplicationController

    # responsible for anything involving our user
    # displays a signup form
    
    #sign up  '/signup' new => creating an user object
    get '/signup' do # render signup form
        # "this is the signup route"
        erb :'/users/signup'
    end

    post '/signup' do
        # receive data from the form inside of params hash
        # create a new user object with the data
        user = User.new(params)
        # validate our user object     
        if params["name"].blank? || params["username"].blank? || params["email"].blank? || params["password"].blank?
         flash[:error] = "Username and password can not be blank, please signup again!"
         # erb :"/users/signup"
         redirect '/signup'
        elsif User.find_by(username: user.username)
            flash[:error]  = "Account with that username already exist, please change username or login! "
          redirect '/login'
        else 
          user.save
          session[:user_id] = user.id   # *** logging user in ***
          redirect '/login'
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
        
        user = User.find_by_username(params[:username])
        # if user exists && password is correct
        if user && user.authenticate(params[:password])
          # login user
          session[:user_id] = user.id    # user logging in
          redirect '/packages'
        else
          flash[:error] = "Invalid username or password login, please login with the correct input!!"
          redirect '/login'
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
