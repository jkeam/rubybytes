require 'sinatra'
require 'json'
require_relative 'models/disassembler_service'

get '/' do
  erb :index
end

post '/?' do
  begin
    json = JSON.parse request.body.read
    @diss = DisassemblerService.disassemble json['version'], json['code']
  rescue => e
    logger.error "Error encountered while trying to dissassemble code"
    logger.error e
    @diss = e.message
  end
  erb :diss, :layout => false
end
