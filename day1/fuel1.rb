print("Fuel needed: " + STDIN.read.lines.inject(0){|sum,l| sum += (l.to_i/3)-2}.to_s + "\n")

