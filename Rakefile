ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.
task :enviroment do
  require 'pry'
end

task :console => :enviroment do
  Pry.start
end