# User Authentication
- the ablity for our user to sign up, login and logout
- keep track of our user: session
- proving that you are ,who you are

## Enable Sessions
- a hash thats stored inside cookies 

## Implement a users model

## Create signup/login/logout routes

## Protect your routes

User Auth:
Login Model,
Social Media, User Ownership...

Sessions:
  - enable sessions
  - utilize sessions hash in the methods that persist user data into appli

authentication:
  - bcrypt gem
  - user model, has_secure_password
  - change our users table, password => password_digest

user is logged in?
  - redirect to homepage, if logged in
  - can't see the signup or login form if logged in

helper methods 
  - application controller => methods available to controllers or
  - app/helpers => helper methods used in your views       