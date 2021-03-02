class Package < ActiveRecord::Base
   # belong to both user and vacation
   belongs_to :user

   # package.user / read the author that the post belongs to
   # package.user= / set/writter the author that post belongs to
   # package.build_user(hash of attributes)
   # package.creat_user(hash of attributes)
   belongs_to :vacation

   # what kind of table is post: joint table

end