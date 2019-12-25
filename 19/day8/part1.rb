
# Resolution of one layer of the space image format
w = 25
h = 6

layer = STDIN.read            # Read input completely
             .chars           # Convert string to char array
             .map(&:to_i)     # Convert char array to int array
             .each_slice(w)   # Split ints by width 
             .to_a            # Convert enumerator to array     
             .each_slice(w*h) # Split by layer size

puts "Count of layer: #{layer.size}"
puts "Layer resolution: #{w}x#{h}=#{w*h}"

the_layer = layer.sort_by do |l| 
    l.flatten.inject(0) do |c,p| 
        c+1 if p == 0
        c
    end
end.first

p the_layer
ones = the_layer.flatten.select{|p| p == 1}.size
twos = the_layer.flatten.select{|p| p == 2}.size

# 1. Submit: 1063980 -> is to high
puts "Solution: #{ones*twos}"
