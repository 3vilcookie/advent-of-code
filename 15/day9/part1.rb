# https://en.wikipedia.org/wiki/Travelling_salesman_problem#Computing_a_solution

start = Time.now
dist = {}
locations = []
STDIN.read.lines.select do |line|
  line.chomp!
  a,b,distance =  line.scan(/^(\w+)\s*to\s*(\w+)\s*=\s*(\d+)$/)[0]
  src = a.to_sym
  dst = b.to_sym
  locations << src
  locations << dst
  dist[src] ||= {}
  dist[src][dst] = distance.to_i
  dist[dst] ||= {}
  dist[dst][src] = distance.to_i
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

tPrep = ((afterPrep - start) * 1_000_000).to_i
tSearch = ((finish - afterPrep) * 1_000_000).to_i
tTotal = ((finish - start) * 1_000_000).to_i

puts "Shortest distance: #{minmax[0]}"
puts "Longest distance: #{minmax[1]}"
puts "---"
puts "Preparation: #{tPrep}µs"
puts "     Search: #{tSearch}µs"
puts "          ∑: #{tTotal}µs"
