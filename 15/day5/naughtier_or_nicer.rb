count = STDIN.read.lines.select do |line|
    line.scan(/(..)\1/).size >= 1 and line.combination(3).any?{|s| s == s.reverse}
end.size
puts count
puts "Wrong answers: 342,575,613,1000, 572 (too high)"
