program = STDIN.read.chomp.split(',').map(&:to_i)

# Patch program
program[1] = 12
program[2] = 2

puts("Op| Op1| Op2| Addr|\n")
(0...program.size).step(4).each do |i|
  break if program[i] == 99

  opcode, op1, op2, addr = program[i,4]

  puts("#{opcode.to_s.rjust(2)}|#{op1.to_s.rjust(4)}|#{op2.to_s.rjust(4)}|#{addr.to_s.rjust(5)}|\n") 

  case opcode
  when 1 
    program[addr] = program[op1] + program[op2]
  when 2
    program[addr] = program[op1] * program[op2]
  end

end
puts("Value at Addr 0: " + program[0].to_s)
