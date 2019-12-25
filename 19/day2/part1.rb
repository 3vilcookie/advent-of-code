require './intcode'

#verb = 12
#noun = 2
verb = 20
noun = 3

interpreter = Intcode.new STDIN.read.chomp.split(',').map(&:to_i)
puts("Value at Addr 0: " + interpreter.run(verb,noun).to_s)
