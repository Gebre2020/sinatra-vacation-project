class User < ActiveRecord::Base

    has_many :packages

    # methods that we get:
    # user.packages
    # user.packages << () shovel a new package to users collection
    # user.packages.build(hash of attributes)
    # user.packages.create(hash of attributes)

    has_many :vacations, through: :packages
    # has many vacations through package
    # user.vacations
    
    has_secure_password
    # adds to salt to our passwords
    # what is salt? extra string, random characters

end