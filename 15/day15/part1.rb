
def calc(mat,vec)
  # V * M^T is equal to calculate all equations at once
  # The matrix must be equation and not variable wise
  # like M = [[a1,b1],[a2,b2],[a3,b3]] and V = [x1,x2]
  #
  # The result will be a vector C with the solution for
  # each equation
  mat.transpose.each_with_index.map do |row, i|
    row.each_with_index.map{|n,i| n*vec[i]}.inject(0,:+)
  end
end

def score(results)
  results.inject(1) do |prod, n|
    next 0 if n < 0
    prod * n
  end
end

def nextX
  (1...100).to_a.permutation(4).to_a.select do |n| 
    yield n if n.inject(0,:+) == 100
  end
end

a = STDIN.read.lines.map do |line|
  c,d,f,t,_ = line.scan(/(-?\d+)+/).flatten
  [c.to_i,d.to_i,f.to_i,t.to_i]
end

p a

# Vector of all teaspoons
#x = [100/a.size] * a.size
max = 0
s = (1...100).step(30).to_a.permutation(a.size).to_a.select do |n| 
  next if n.inject(0,:+) == 100
  n = score(calc(a, nextX))
  max = p n if n > max
end

puts "Score: #{s}"
