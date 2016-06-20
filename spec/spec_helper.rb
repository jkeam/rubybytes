ENV['RACK_ENV'] = 'test'

require 'rack/test'  
require_relative '../web.rb'

include Rack::Test::Methods

require 'coveralls'
Coveralls.wear!

def app  
  Sinatra::Application
end
