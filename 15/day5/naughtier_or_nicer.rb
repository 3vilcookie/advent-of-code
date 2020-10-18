# Checks if a string contains a n-sized substring
# that appears at least twice.
def has_duplicate?(s)
  # Length of the substring that has to appear twice
  duplicate_len = 2

  # Iterate through the index to build needle and
  # haystack on our own. There might be a more
  # efficient or convenient solution..
  (s.size - duplicate_len*2 + 1).times do |i| 
    # Possible duplicate
    needle = s[i, duplicate_len]

    # Rest of the string where the duplicate has to
    # be searched
    haystack = s[i+duplicate_len..s.size-1]
    return true if haystack.include? needle
  end
  false
end

def has_palindrome?(s)

  palindrom_len = 3

  (s.size - palindrom_len + 1).times do |i|
    str = s[i, palindrom_len]
    return true if str == str.reverse
  end
  false
end

count = STDIN.read.lines.select do |line|
  line.chomp!
  has_duplicate?(line) and has_palindrome?(line)
end.size
puts count
puts 'Right answer: 53'
puts 'Wrong answers: '
puts '  - To high: 342, 575, 613, 1000, 572, 110'
puts '  - Just wrong: 3'
