count = STDIN.read.lines.select do |line|
    line.scan(/ab|cd|pq|xy/).empty? and line.scan(/[aeiou]/).size >= 3 and line.scan(/(.)\1/).size >= 1
end.size
puts count
puts "Wrong answers: 342,575,613,1000, 572 (too high)"
