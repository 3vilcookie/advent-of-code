
def opcode_name(opcode)
    case opcode
    when 1
        "ADD"
    when 2
        "SUB"
    when 99
        "END"
    else
        "???"
    end
end

program = STDIN.read.chomp.split(',').map(&:to_i)

puts(" Op| Op1| Op2| Addr|\n")
puts("---+----+----+------\n")

(0...program.size).step(4).each do |i|
    if program[i] == 99
        puts(" 99|    |    |     |\n")
        next
    end
  opcode, op1, op2, addr = program[i,4]

  opname = opcode_name(opcode)


  puts("#{opname}|#{op1.to_s.rjust(4)}(#{program[op1].to_s.rjust(3)})|#{op2.to_s.rjust(4)}(#{program[op2].to_s.rjust(3)})|#{addr.to_s.rjust(5)}|\n")
end
