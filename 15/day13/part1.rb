relations = {}
STDIN.read.lines.select do |line|
  line.chomp!
  a,dir, metric, b = line.scan(/^([A-Z]\w+).*(gain|lose)\s(\d+).*([A-Z]\w+)\.$/).first
  metric = metric.to_i
  metric *= -1 if dir == 'lose'
  relations[a] ||= {}
  relations[a][b] = metric
end

members = relations.keys

result = members.permutation(members.size).map do |order|
  (order.size).times.inject(0) do |sum,i|
    a = order[i]

    b = if i == order.size-1
          order[0]
        else
          order[i+1]
        end
    relations[a][b] + relations[b][a] + sum
  end
end.minmax

puts "Smallest change: #{result[0]}"
puts "Greatest change: #{result[1]}"

puts "Too low: 382"
puts "Too high: 958"
puts "Right answer: 664"
