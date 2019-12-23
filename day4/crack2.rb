puts (372304..847060).to_a.map(&:to_s).reject{|pw| pw.chars.sort.to_s == pw and pw.chars.uniq.size < 6}.size
