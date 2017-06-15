require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride  # This needs to be above all Controllers for PUT,
                          # PATCH, and DELETE to work correctly
use RecipeController
run ApplicationController
