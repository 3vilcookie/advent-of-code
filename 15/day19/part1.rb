rules = []
rmol = ""
STDIN.read.lines.select do |line|
  line.chomp!
  next if line == ""
  rule = line.scan(/(\w+) => (\w+)/)[0]
  if rule.nil?
    rmol = line.scan(/[A-Z][a-z]*/)
  else
    rules << rule
  end
end

mols = []
rules.each do |rule|
  rmol.size.times do |i|
    if rmol[i] == rule[0]
      newmol = rmol.dup
      newmol[i] = rule[1]
      mols << newmol.join
    end
  end
end

puts "#{mols.uniq.size} unique molecules"
puts "Right answer: 509"
