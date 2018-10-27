puts ARGV.to_s

number = ARGV[0].to_i

while number % 2 == 0 && number != 0
  number /= 2
end

puts number