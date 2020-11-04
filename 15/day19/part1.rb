rules = []
reindeer_molecule = ""
STDIN.read.lines.select do |line|
  line.chomp!
  next if line == ""
  rule = line.scan(/(\w+) => (\w+)/)[0]
  if rule.nil?
    reindeer_molecule = line
  else
    rules << rule
  end
end

p rules
p reindeer_molecule
