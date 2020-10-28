

def check_pw(pw)


  straight = (pw.size-2).times.map do |i|
    pw[i].ord == pw[i+1].ord-1 and pw[i].ord == pw[i+2].ord-2
  end.any?{|x| x}
  return false unless straight
  return false if pw =~ /[iol]/

  pairs = pw.chars.inject([]) do |memo, obj|
    if memo.size == 0 or memo.last.first != obj
      memo << [obj, 1]
    else
      memo[-1][-1] += 1
    end
    memo
  end.map(&:last).count{|x| x>1}

  return false if pairs < 2
  true
end

def next_pw(pw)
  while true 
    pw.succ!
    return pw if check_pw(pw)
  end
end

initial = "hxbxwxba"
part1 = next_pw(initial)
puts "Next pw is #{part1}"
part2 = next_pw(part1)
puts "Next pw is #{part2}"
puts "Wrong pws: hxbxxaaa"

