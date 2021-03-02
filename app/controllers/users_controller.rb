class UserController < ApplicationController

    # responsible for anything involving our user

    
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
        # if user.username != ""
        if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:email]) 
            redirect '/signup'
        else
            user.save
            session[:user_id] = user.id  # **** logging user in ****
            redirect '/packages'
        end
        # if our user is valid
           # persist the new object
        # else
           # redirect them back to signup page
        # user must use unique data/ put a message this data is already exiting
    end

    
    #login  '/login' read => querying our user and reading user attribute

     get '/login' do  # render the login form    
         erb :"users/login"
         #binding.pry
     end

    post '/login' do
        # gather data from the form => params
        # find my user object
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

    #logout  '/logout' delete => clears our session
    get '/logout' do
        session.clear
        redirect '/login'
    end

end