containers = STDIN.read.lines.map do |line|
  line.chomp!.to_i
end

count = 0
containers.size.times do |t|
  count += containers.combination(t).inject(0) do |sum, obj|
    next sum if obj.inject(0,:+) != 150
    sum + 1
  end
end

puts "Count: #{count}"
puts "Right answer: 1638"
