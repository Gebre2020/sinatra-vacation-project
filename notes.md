[] - User can create, read, update and delete a packages

# Interface:
  - User can view package form
  - User can submit package form
  - User can edit package 
  - User can delete/cancel package
# User class
  - attributes => name, password
  - user signs up/login
  - has many packages

# User controller and views
  - '/users/signup' => renders sign up form 
  - '/users/signup' => processes sign up form, creates user, post 
  - '/users/login' => renders login form  
  - '/users/signup' => processes login form, post
  - need to set sessions
  - user can view their packages, '/users/:id/packages'

# package class 
  - attributes => package_name, package_budget, user_id, vaction_id
  - package belongs to user

# package controller and views
  - '/packages/new => renders new package form
  - '/packages' => submits package
  - '/packages' => renders all packages
  - '/packages/:id => renders one instance
  - '/packages/:id/edit => renderes update form for an instance
  - '/packages/:id => update instance
  - '/packages/:id/deletes instance

# where to start?

  - set up classes
  - set up my database
  - users controller
  - packages controller


# Sinatra basic
Sinatra is a library build with Ruby code

key terms
- erb => embedded ruby
- render => display
- persist/response flows => adding data to your db
- request/response flows
- DSL - Domain Specific Language
- MVC - models, views, controllers

# Client vs Server
  - client or user is the requesting side
  - server is application/us

  MVC
   - Controller should alwaysbe the middle man between model and view
   - View and model should never directly communicate

# Differnce between find and find_by

name attribute of input field determines the keys in your params hash

# all routes pertaining to package model
   <%= %> = interpolates ruby code in views
           = what our user sees
           
   <% %> = what our views process


