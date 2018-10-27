r = rand(100)
puts 'Podaj liczbę:'
loop do
 x = gets.chomp.to_i
 if r == x
   puts 'zgadłeś, gratulacje!'
   break
 elsif r < x
   puts 'mniej'
 else
   puts 'więcej'
 end
end