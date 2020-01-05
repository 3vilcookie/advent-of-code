count = STDIN.read.lines.map do |line|
  line.chomp!
  in_memory_size = line.size
  literal_string = '"' + line.gsub(/[\\"]/,"11") + '"'
  literal_size = literal_string.size

  puts "#{literal_string} <- #{line} = #{literal_size} - #{in_memory_size} = #{literal_size - in_memory_size}"

  literal_size - in_memory_size
end.inject(:+)

puts "Wrong answers:"
puts "Too low: 600"
puts "Right answer: 2074"
puts count
