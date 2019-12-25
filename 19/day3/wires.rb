wires = []
STDIN.read.each_line do |l|
    wire = []
    l.chomp
     .split(',')
     .inject([0,0]) do |last,current|
        direction,steps = current.scan(/([LRUD])([0-9]+)/)[0]
        new = last.dup
        case direction
        when 'L'
            new[0] -= steps.to_i
        when 'R'
            new[0] += steps.to_i
        when 'U'
            new[1] += steps.to_i
        when 'D'
            new[1] -= steps.to_i
        end
        wire << new
        new
    end

    wires << wire
end

p wires
