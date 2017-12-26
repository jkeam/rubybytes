class Disassembler

  def self.disassemble(src)
    out = StringIO.new
    $stderr = out
    begin
      RubyVM::InstructionSequence.compile(src).disassemble
    rescue StandardError => e
      puts e.message
      out.string
    end
  end

end
