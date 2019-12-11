program = STDIN.read.chomp.split(',').map(&:to_i)

memory = {1 => 12, 2 => 2 }

puts("Opcode | Op1 | Op2 | Addr |\n")
(0...program.size).step(4).each do |i|
  break if program[i] == 99

  opcode, op1, op2, addr = program[i,4]

  puts("#{opcode} | #{op1} | #{op2} | #{addr}|\n") 

  raise("Access violation") unless memory.key?(op1) and memory.key?(op2)
  memory << addr unless memory?key(addr)
  case opcode
  when 1 
    memory[addr] = memory[op1] + memory[op2]
  when 2
    memory[addr] = memory[op1] - memory[op2]
  end

end

puts("End of program\n")

puts("Memory dump:\n")
p memory
