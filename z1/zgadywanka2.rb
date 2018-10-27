random_number = rand(0...100)

puts "Wylosowano: #{random_number}"

DIV = 2

range_begin = 0
range_end = 99
current_guess = (range_begin + range_end) / DIV

while current_guess != random_number
  if current_guess > random_number
    puts "Liczba #{current_guess} jest za duża"
    range_end = current_guess - 1
  else current_guess < random_number
    puts "Liczba #{current_guess} jest za mała"
    range_begin = current_guess + 1
  end
  current_guess = (range_begin + range_end) / DIV
end

puts 'Podałeś właściwą liczbę'