class User < ActiveRecord::Base

    has_many :packages
    # has_many :vacations, through: :packages

    has_secure_password
    # adds to salt to our passwords / bcrypt
    # adds extra string, random characters
   
end