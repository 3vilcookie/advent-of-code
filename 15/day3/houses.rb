positions = [[0,0]]
STDIN.read.each_char do |current|
    x,y = positions.last
    new_pos = case current
        when '^'
            [x,y+1]
        when 'v'
            [x,y-1]
        when '>'
            [x+1,y]
        when '<'
            [x-1,y]
    end

    positions << new_pos
end
puts "Visited #{positions.size} unique and #{positions.uniq.size} unique houses.\n"
