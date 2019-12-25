ribbon_need = STDIN.read.lines.map do |line|
    next 0 if line.chomp.empty?

    dimensions = line.scan(/^(\d+)x(\d+)x(\d+)$/)[0].map(&:to_i)

    2*dimensions.min(2).inject(:+) + dimensions.inject(:*)
end.inject(:+)

puts "Wrong answers: 3818626 (too low)"
puts "Total need of ribbon : #{ribbon_need} sqft"
