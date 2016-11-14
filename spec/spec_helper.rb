ENV['RACK_ENV'] = 'test'

require 'dotenv'
Dotenv.load
require 'rack/test'
require_relative '../web.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end
