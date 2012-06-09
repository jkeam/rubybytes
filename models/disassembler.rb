class Disassembler

  def self.disassemble(src)
    out = StringIO.new
    $stderr = out
    begin
      diss = RubyVM::InstructionSequence.compile(src).disassemble
      puts diss
      diss
    rescue Exception => e
      out.string
    end
  end

end
