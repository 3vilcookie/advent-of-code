require 'digest'

secret = "bgvyzdsv"
needle = "000000"
hash = ""
counter = 0
while true
    hash = Digest::MD5.hexdigest(secret + counter.to_s)
    break if hash.start_with?(needle)

    puts "#{counter} hashes computed" if counter % 10000 == 0
    counter +=1
end

puts "md5(#{secret + counter.to_s}) = #{hash}\n"
