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
    # 
end