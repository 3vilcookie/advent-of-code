display = {}

def turn_on(n)
  n + 1
end

def turn_off(n)
  n -= 1
  return 0 if n < 0
  n
end

def toggle(n)
  n + 2
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
      display[y][x] ||= 0
      display[y][x] = send(action.to_sym,display[y][x])
    end
  end

  round += 1
end

puts "The total brightness is #{display.values.map(&:values).flatten.inject(0,:+)}"
puts "Right answer: 17836115"
