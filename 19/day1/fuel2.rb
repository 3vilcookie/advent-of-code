def partialSum(n)
  return 0 if n < 0

  return n + partialSum(n/3-2)
end

print("Fuel needed: " + STDIN.read.lines.inject(0){|sum,l| sum += partialSum((l.to_i/3)-2)}.to_s + "\n")

