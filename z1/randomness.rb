x = rand

if x < 0.2
  puts "not enough #{x}"
  y = rand
  if y < 0.5
    puts 'ayy lmao'
  end
elsif x > 0.4
  puts "too much #{x}"
else
  puts "will do #{x}"
end