puts "Wita Cie kalkulator :-)"
dzialanie = 0

while dzialanie != 5

 puts "Wybierz działanie:
 1. Dodawanie
 2. Odejmowanie
 3. Mnożenie
 4. Dzielenie

 5. WYJŚCIE"

 dzialanie=gets.chomp.to_i

 next unless (1..5).include?(dzialanie)

 if dzialanie==5
   puts "

   Do widzenia


   "
   exit(0)
 elsif dzialanie > 5
   puts "Żły wybor typu działania!!!"
   exit(0)
 end


 puts "Podaj pierwszą liczbę"
 liczba1=gets.chomp.to_f

 puts "Podaj drugą liczbę"
 liczba2=gets.chomp.to_f


 if dzialanie==1
   wynik=liczba1 + liczba2
 elsif dzialanie==2
   wynik=liczba1-liczba2
 elsif dzialanie==3
   wynik=liczba1*liczba2
 elsif dzialanie==4
   wynik=liczba1/liczba2

 end
 puts "Twój wynik: #{wynik}\n"

end
