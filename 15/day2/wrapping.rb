wrapping_paper_need = STDIN.read.lines.map do |line|
    next 0 if line.chomp.empty?

    dimensions = line.scan(/^(\d+)x(\d+)x(\d+)$/)[0].map(&:to_i)
    side_areas = dimensions.combination(2).to_a.map{|dim| dim[0]*dim[1]}

    2*side_areas.inject(:+) + side_areas.min
end.inject(:+)

puts "Total need of wrapping paper: #{wrapping_paper_need} sqft"
