require 'shotgun'

require 'bundler'
Bundler.require

# Require every gem in the gem file.

ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
 :adapter => "sqlite3",
 :database => "db/songs-#{ENV['SINATRA_ENV']}.db"
)

ActiveRecord::Base.logger = nil


require 'net/https'
require 'uri'
require 'time'
require 'yaml'
require_relative '../app.rb'


require_all 'lib'

