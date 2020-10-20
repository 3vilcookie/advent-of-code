

class VM
  
  def initialize
    @memory = {}
  end

  def eval(line)
    instruction = 
      /^(?<input1>[0-9a-z]*)\s*(?<operation>[A-Z]+)\s(?<input2>[0-9a-z]+)\s->\s(?<output>[a-z]+)$/
      .match(line)

    raise "failed to parse line #{@index}: #{line}" unless instruction

    method = if instruction.named_captures.has_key? 'operation'
               instruction['operation'].downcase.to_sym
             else
               :assign
             end

    puts "Would call #{method.to_s} with arguments #{instruction.named_captures.reject{|key| key == 'operation'}.inspect}"
    send(method, instruction.named_captures.reject{|key| key == 'operation'})
    @index += 1
  end

  def mem_dump
    p memory
  end

  private 
  
  attr_accessor :memory, :index

  def memory
    @memory
  end

  def assign(input1, output)
    memory[output] = loadif(input1)
  end

  def loadif(x)
    memory[x] if memory.has_key?(x)
    x.to_i
  end

  def not(input1, output)
    memory[output] = ~loadif(input1)
  end

  def and(input1, input2, output)
    memory[output] = loadif(input1) & loadif(input2)
  end

  def or(input1, input2, output)
    memory[output] = loadif(input1) | loadif(input2)
  end

  def lshift(input1, input2, output)
    memory[output] = loadif(input1) << input2.to_i
  end

  def rshift(input1, input2, output)
    memory[output] = loadif(input1) >> input2.to_i
  end

end


vm = VM.new
STDIN.read.lines.select do |line|
  line.chomp!
  vm.eval line
end

vm.mem_dump
