class Vacation < ActiveRecord::Base
    has_many :packages
    has_many :users, through: :packages 
end 