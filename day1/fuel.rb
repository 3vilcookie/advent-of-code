puts("Fuel needed: " + STDIN.read.lines.inject(0){|sum,l| sum += (l.to_i/3).ceil-2}.to_s)
