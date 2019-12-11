
def dump_memory(memory)
  puts("Memory dump:\n")
  p memory
end

program = STDIN.read.chomp.split(',').map(&:to_i)

memory = {0 => 12, 1 => 2 }

puts("Op | Op1 | Op2 | Addr |\n")
(0...program.size).step(4).each do |i|
  break if program[i] == 99

  opcode, op1, op2, addr = program[i,4]

  puts("#{opcode} | #{op1} | #{op2} | #{addr}|\n") 

  dump_memory(memory);raise("Access violation with op1") unless memory.key?(op1)
  dump_memory(memory);raise("Access violation with op2") unless memory.key?(op2)

  case opcode
  when 1 
    memory[addr-1] = memory[op1] + memory[op2]
  when 2
    memory[addr-1] = memory[op1] * memory[op2]
  end

end

puts("End of program\n")

dump_memory
