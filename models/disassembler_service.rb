require 'faraday'
require 'json'

class DisassemblerService

  def self.disassemble(version, src)
    case version
    when 'ruby_21'
      url = ENV['RUBY21_API']
    when 'ruby_22'
      url = ENV['RUBY22_API']
    when 'ruby_23'
      url = ENV['RUBY23_API']
    else
      url = nil
    end

    if url.nil?
      puts "Unknown ruby target: #{version}"
      return "Unknown ruby target"
    else
      puts "Hitting #{url} for #{version}"
    end

    begin
      conn = Faraday.new(url: url)
      resp = JSON.parse(conn.post('/', { code: src }).body)
      return resp['result'] if resp['result']
      return resp['errors'] if resp['errors']
    rescue StandardError => e
      puts e.message
      "Unknown error occurred"
    end
  end

end
