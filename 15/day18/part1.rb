
def neighbours(cells, x,y)
  sum = 0
  
  # Left-Bottom
  sum += 1 if x > 0 and y > 0 and cells[y-1][x-1]
 
  # Left
  sum += 1 if y > 0 and cells[y-1][x]
  
  # Left-Top
  sum += 1 if y > 0 and x < 100-1 and cells[y-1][x+1]

  # Top
  sum += 1 if x < 100-1 and cells[y][x+1]

  # Right-Top
  sum += 1 if x < 100-1 and y < 100-1 and cells[y+1][x+1]

  # Right
  sum += 1 if y < 100-1 and cells[y+1][x]

  # Right-Bottom
  sum += 1 if y < 100-1 and x > 0 and cells[y+1][x-1]

  # Bottom
  sum += 1 if x >0 and cells[y][x-1]
  
  sum
end

def generation(cells)
  cells.size.times do |y|
    cells[y].size.times do |x|
      n = neighbours(cells, x, y)
      
      if cells[y][x] and (n < 2 or n > 3)
        cells[y][x] = false 
      elsif !cells[y][x] and n == 3
        cells[y][x] = true 
      end
    end
  end
  cells
end

def on (display)
  display.flatten.inject(0) do |sum, light|
    sum += 1 if light
    sum
  end
end

display = []
STDIN.read.lines.select do |line|
  line.chomp!
  # raise "Line must have a width of 100" if line.size != 100
  display << line.chars.map{|f| f == '#'}
end

100.times{|_| p on(generation(display))}

on = on(display)
puts "#{on} lights are on."
puts "355 is too low"
puts "3890 is too high"
