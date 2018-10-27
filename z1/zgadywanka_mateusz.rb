random_number = rand(0...100)

puts 'Podaj liczbę w zakresie od 0 do 99'

while (user_number = gets.chomp.to_i) != x
 if user_number > random_number
   puts 'Liczba jest za duża'
 else user_number < random_number
   puts 'Liczba jest za mała'
 end
end

puts 'Podałeś właściwą liczbę'