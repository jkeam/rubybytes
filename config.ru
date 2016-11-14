$stdout.sync = true
require 'dotenv'
Dotenv.load
require 'rubygems'
require 'sinatra'
require './web'
run Sinatra::Application
