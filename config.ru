require_relative './config/environment.rb'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

# another controller
# use controller_name

use Rack::MethodOverride   # required inorder forms to have a _method, 
                           # allowing PUT & DELETE action to function
use PackagesController
use UserController
run ApplicationController
