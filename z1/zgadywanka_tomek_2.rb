x = rand(100)
w = gets.chomp.to_i

while x != w
 if w > x
   puts "wpisales za duza wartosc "
 else
   puts "wpisales za mala wartosc"
 end
 w = gets.chomp.to_i

end

puts "huraa twoj wynik to #{w}"