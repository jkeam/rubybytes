require 'rubygems'
require 'sinatra'
require 'json'
require_relative 'models/disassembler'

get '/' do
  erb :index
end

post '/?' do
  json = JSON.parse(request.body.read)
  code = json['code']
  @diss = Disassembler.disassemble(code)
  erb :diss, :layout => false
end
