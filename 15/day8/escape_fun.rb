count = STDIN.read.lines.map do |line|
  line.chomp!
  literal_size = line.size
  in_memory_string = line.gsub(/\\([\\"]|x[\da-f]{2})/,'1')
  in_memory_string = in_memory_string[1..in_memory_string.size-2]
  in_memory_size = in_memory_string.size

  puts "#{line} -> #{in_memory_string} = #{literal_size} - #{in_memory_size} = #{literal_size - in_memory_size}"
  literal_size - in_memory_size
end.inject(:+)

puts "Wrong answers:"
puts "Too low: 376, 1122"
puts "Right answer: 1342"
puts count
