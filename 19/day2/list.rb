
def instruction_name(instruction)
    case instruction
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

puts(" op| p1| p2| addr|\n")
puts("---+----+----+------\n")

(0...program.size).step(4).each do |instruction_pointer|
    if program[instruction_pointer] == 99
        puts(" 99|   |   |    |\n")
        next
    end
  instruction, p1, p2, addr = program[instruction_pointer,4]

  opname = instruction_name(instruction)


  puts("#{opname}|#{p1.to_s.rjust(3)}(#{program[p1].to_s.rjust(3)})|#{p2.to_s.rjust(3)}(#{program[p2].to_s.rjust(3)})|#{addr.to_s.rjust(5)}|\n")
end
