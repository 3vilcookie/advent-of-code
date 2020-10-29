time = 2503

reindeers = STDIN.read.lines.map do |line|
  line.chomp!
  _, speed, ts, tr = line.scan(/^([A-Z]\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds.$/).first
 
  {speed: speed.to_i, ts: ts.to_i, tr: tr.to_i, dist: 0, points: 0}
end

rank = time.times.map.inject(reindeers) do |deers, t|

  # Calculate the next second for each reindeer
  deers.each do |d|
    d[:dist] += d[:speed] if t % (d[:ts] + d[:tr]) < d[:ts]
  end

  # Check which distance is the greatest
  greatest_dist = deers.map{|x|x[:dist]}.max

  # Give every reindeer a point which has this distance
  deers.each {|d| d[:points] += 1 if d[:dist] == greatest_dist}
  
  deers
end.sort_by{|h| h[:points]}

puts "Winner: #{rank[-1][:dist]} km with #{rank[-1][:points]} points"
puts "Looser: #{rank[0][:dist]} km with #{rank[0][:points]} points"

puts "Right answer: 1059"
