require_relative './config/environment.rb'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

# another controller
# use controller_name

# use Rack::MethodOverride
use UsersController
use packagesController
run ApplicationController
