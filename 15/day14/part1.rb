time = 2503

rank = STDIN.read.lines.map do |line|
  line.chomp!
  name, speed, ts, tr = line.scan(/^([A-Z]\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds.$/).first
  
  dist = time.times.map.inject(0) do |sum, i|
    next sum if i % (ts.to_i+tr.to_i) >= ts.to_i
    sum + speed.to_i
  end

  [name, dist ]
end.sort_by(&:last)

p rank

puts "Winner: #{rank[-1][0]} with #{rank[-1][1]} km"
puts "Looser: #{rank[0][0]} with #{rank[0][1]} km"
puts "Too high: 5032"
puts "Too low: 2460"
puts "Wrong answer: 2660"
