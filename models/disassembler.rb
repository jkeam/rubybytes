class Disassembler

  def self.disassemble(src)
    out = StringIO.new
    $stderr = out
    begin
      RubyVM::InstructionSequence.compile(src).disassemble
    rescue Exception => e
      out.string
    end
  end

end
