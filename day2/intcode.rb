
class Intcode
    def initialize(program)
        @program = program.dup
    end
    
    def size
        @program.size
    end

    def run(noun=12,verb=2)
        
        @program[1] = noun
        @program[2] = verb
        
        #puts("op| p1| p2| addr|\n")
        
        (0...@program.size).step(4).each do |i|
          break if @program[i] == 99

          instruction, p1, p2, addr = @program[i,4]

          #puts("#{instruction.to_s.rjust(2)}|#{p1.to_s.rjust(4)}|#{p2.to_s.rjust(4)}|#{addr.to_s.rjust(5)}|\n") 

          case instruction
          when 1 
            @program[addr] = @program[p1] + @program[p2]
          when 2
            @program[addr] = @program[p1] * @program[p2]
          end
        end

        @program[0]
    end
end

