
require './circuit'

c = Circuit.new

STDIN.read.lines.select do |line|
  line.chomp!
  p line
  c.parse line
end

puts "wire(a) = #{c.query('a')}"
puts "Right answer: 46065"
