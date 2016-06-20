require "minitest/autorun"
require_relative 'spec_helper.rb'

require 'coveralls'
Coveralls.wear!

describe "my example spec" do  
  it "should successfully return the main index page" do
    get '/'
    last_response.body.must_include 'Ruby Dissassembler'
  end

  it "should be able to post some code to disassemble" do
    code = "puts 'hi'"
    post('/', "{\"code\": \"#{code}\"}", { "CONTENT_TYPE" => "application/json" })
    last_response.body.must_include 'disasm'
  end
end  
