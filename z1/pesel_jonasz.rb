def check_date_and_gender(pesel_in_int)
  year_birth = 0
  number_from_last_two_digits_year_birth = pesel_in_int[0]*10 + pesel_in_int[1]
  number_from_month_birth = pesel_in_int[2]*10 + pesel_in_int[3]
  number_from_day_birth = pesel_in_int[4]*10 + pesel_in_int[5]
  number_gender = pesel_in_int[9]

  gender =
    if number_gender.even?
      :female
    else
      :male
    end

  number_is_correct = true

  if number_from_month_birth > 80 && number_from_month_birth < 93
    number_from_month_birth -= 80
    year_birth = 1800 + number_from_last_two_digits_year_birth
  elsif number_from_month_birth > 0 && number_from_month_birth < 13
    year_birth = 1900 + number_from_last_two_digits_year_birth
  elsif number_from_month_birth > 20 && number_from_month_birth < 33
    number_from_month_birth -= 20
    year_birth = 2000 + number_from_last_two_digits_year_birth
  elsif number_from_month_birth > 40 && number_from_month_birth < 53
    number_from_month_birth -= 40
    year_birth = 2100 + number_from_last_two_digits_year_birth
  elsif number_from_month_birth > 60 && number_from_month_birth < 73
    number_from_month_birth -= 60
    year_birth = 2200 + number_from_last_two_digits_year_birth
  else
    number_is_correct = false
  end

  if number_from_day_birth > 31
    number_is_correct = false
  end

  if number_is_correct
    print "gender: ", gender, "\n"
    print "date of birth: ", number_from_day_birth, "-",number_from_month_birth ,"-",year_birth, "\n"
  else
    print "Number pesel has incorrect value. \n"
  end

end #end of declaration function check_date_and_gender

def calculate_pesel(pesel_number)
  pesel_number = pesel_number.split('')
  pesel_length = pesel_number.size

  pesel_in_int = []
  pesel_number.map do |a|
    pesel_in_int << a.to_i
  end

  weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]
  control_sum = 0
  i=0
  while i < pesel_length - 1
    control_sum += pesel_in_int[i]*weights[i]
    i += 1
  end

  control_sum %= 10
  control_sum = 10 - control_sum
  control_sum %= 10

  print "Information about pesel: \n"
  if control_sum == pesel_in_int[-1]
    print "sum control is correct \n"
    check_date_and_gender(pesel_in_int)
  else
    print "sum control isn't correct \n"
  end
end # end of declaration function check pesel

pesel_number = ARGV[0]
if pesel_number =~ /^[0-9]{11}$/
  calculate_pesel(pesel_number)
else
  print "You must enter the pesel number in the correct format. \n"
  print "The pesel number should be a series of eleven digits. \n"
end
