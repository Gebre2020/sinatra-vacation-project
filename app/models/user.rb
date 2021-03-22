class User < ActiveRecord::Base

    has_many :packages
    has_many :vacations, through: :packages
    has_secure_password
   
end