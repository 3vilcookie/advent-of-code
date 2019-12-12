puts (372304...847060).to_a.inject(:+) do |pw|
  next 0 unless pw.to_s.scan(/(.)\1/).size >= 2
  next 0 unless pw.to_s.chars.inject(0){|p,d| break false unless p<=d;d}
  1
end
