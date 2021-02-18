ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


# Type `rake -T` on your command line to see the available rake tasks.
desc 'open pry'
task :c => :env do 
  Pry.start
end

desc 'load env. file'
task :env do
  require_relative './config/environment'
end