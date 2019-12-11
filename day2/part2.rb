require './intcode'

actual = 0
expected = 19690720

program =  STDIN.read.chomp.split(',').map(&:to_i)

while expected != actual
    interpreter = Intcode.new program

    noun = rand(interpreter.size)
    verb = rand(interpreter.size)

    actual = interpreter.run(noun,verb)
end

puts("100 * #{noun} + #{verb} = #{100*noun+verb}\n")
