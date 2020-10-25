require './circuit'

c = Circuit.new

STDIN.read.lines.select do |line|
  line.chomp!
  line = "46065 -> b" if line.end_with? "-> b"
  c.parse line
end

puts "wire(a) = #{c.query('a')}"
puts "Right answer: 14134"
