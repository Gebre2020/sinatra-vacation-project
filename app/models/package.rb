class Package < ActiveRecord::Base
   # belong to both user and package
   belongs_to :user

   # package.user / read the user that the package belongs to
   # package.user= / set/writter the user that package belongs to
   # package.build_user(hash of attributes)
   # package.create_user(hash of attributes)
   belongs_to :vacation

end