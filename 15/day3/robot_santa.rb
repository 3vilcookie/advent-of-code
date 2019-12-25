santa_pos = [[0,0]]
robot_pos = [[0,0]]

def move(positions, direction)
    x,y = positions.last
    new_pos = case direction
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

STDIN.read.scan(/../) do |current|
    move(santa_pos, current[0])
    move(robot_pos, current[1])
end

combined_pos = santa_pos + robot_pos

puts "Santa visited #{santa_pos.size} houses in toal and #{santa_pos.uniq.size} unique.\n"
puts "Robot santa visited #{robot_pos.size} houses in toal and #{robot_pos.uniq.size} unique.\n"
puts "Together they visited #{combined_pos.size} houses in total and #{combined_pos.uniq.size} unique.\n"
