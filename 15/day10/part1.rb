
def look_and_say(input)
  input.chars.inject([]) do |memo, obj|
    if memo.last != obj
      memo << 1
      memo << obj
    else
      memo[-2] += 1
    end
    memo
  end.map(&:to_s).join
end

initial = "1113222113"
result = 50.times.inject(initial){ |memo,_| look_and_say(memo)}
puts "look-and-say(#{initial}).size = #{result.size}"
