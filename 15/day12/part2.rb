
require 'oj'


input = Oj.load(File.read("input"))

def sum(h)
  h.flatten.inject(0) do |memo, n|
    next memo if n.is_a? String
    next memo+n if n.is_a? Integer
    next memo if n.is_a? Hash and n.values.include? "red"
    memo + sum(n)
  end
end

puts "Sum: #{sum(input)}"
puts "Part2: 87842"
