containers = STDIN.read.lines.map do |line|
  line.chomp!.to_i
end

def min_comb(containers)
  containers.size.times do |t|
    containers.combination(t) do |obj|
      return t if obj.inject(0,:+) == 150
    end
  end
end

count = containers.combination(min_comb(containers)).inject(0) do |sum, obj|
  next sum if obj.inject(0,:+) != 150
  sum + 1
end

puts "Count: #{count}"
puts "Right answer: 17"
