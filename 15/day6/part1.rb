display = {}

def turn_on(_)
  true
end

def turn_off(_)
  false
end

def toggle(n)
  !n
end

round = 0
STDIN.read.lines.select do |line|
  line.chomp!
  action, start_x, start_y, end_x, end_y = 
    line.scan(/^([a-z\s]+)(\d+),(\d+)\sthrough\s(\d+),(\d+)$/)[0]

  action.strip!.sub!(' ','_')

  print '.' if round % 10 == 0

  (start_x.to_i..end_x.to_i).each do |x|
    (start_y.to_i..end_y.to_i).each do |y|
      display[y] ||= {}
      display[y][x] ||= false
      display[y][x] = send(action.to_sym,display[y][x])
    end
  end

  round += 1
end

puts " #{display.values.map(&:values).flatten.count(true)} lights are burning"
puts "Too low: 828"
