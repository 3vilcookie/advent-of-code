a =  (372304..847060).to_a.map do |pw|
  next 0 if pw.to_s.scan(/(.)\1/).empty?
  next 0 unless pw.to_s.chars.inject(0){|p,d| break false unless p.to_i<=d.to_i;d.to_i} != false
  1
end.sum

puts a
