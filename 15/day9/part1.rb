# https://en.wikipedia.org/wiki/Travelling_salesman_problem#Computing_a_solution

start = Time.now
dist = {}
locations = []
STDIN.read.lines.select do |line|
  line.chomp!
  a,b,distance =  line.scan(/^(\w+)\s*to\s*(\w+)\s*=\s*(\d+)$/)[0]
  locations << a
  locations << b
  dist[a] ||= {}
  dist[a][b] = distance.to_i
  dist[b] ||= {}
  dist[b][a] = distance.to_i
end

afterPrep = Time.now
locations.uniq!
minmax = locations.permutation(locations.size).map do |route|
  distance = 0
  (route.size-1).times.each do |i|
    distance += dist[route[i]][route[i+1]]
  end
  distance
end.minmax

finish = Time.now

puts "Shortest distance: #{minmax[0]}"
puts "Longest distance: #{minmax[1]}"
puts "---"
puts "Preparation: #{afterPrep-start}"
puts "     Search: #{finish-afterPrep}"
puts "          ∑: #{finish-start}"
