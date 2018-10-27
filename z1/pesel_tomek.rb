#
#
# UWAGA! SPOILER
#
#
#

require 'pry-byebug'

# This method returns a person's year of birth based on
# their PESEL number.
#
# @param [Array] pesel The person's PESEL number given as array of integers
#
# @return [Integer] The person's year of birth
#
# @example
def get_year(pesel)
  year = 10 * pesel[0] + pesel[1]
  month = 10 * pesel[2] + pesel[3]
  if month > 80 && month < 93
    year += 1800
  elsif month > 0 && month < 13
    year += 1900
  elsif month > 20 && month < 33
    year += 2000
  elsif month > 40 && month < 53
    year += 2100
  elsif month > 60 && month < 73
    year += 2200
  end
  year
end

def get_month(pesel)
  month = 10 * pesel[2] + pesel[3]
  if month > 80 && month < 93
    month -= 80
  elsif month > 20 && month < 33
    month -= 20
  elsif month > 40 && month < 53
    month -= 40
  elsif month > 60 && month < 73
    month -= 60
  end
  month
end

def get_day(pesel)
  10 * pesel[4] + pesel[5]
end

def get_sex(pesel)
  if pesel[9].odd?
    :male
  else
    :female
  end
end

def checksum?(pesel)
  sum = pesel[0] * 1
  sum += pesel[1] * 3
  sum += pesel[2] * 7
  sum += pesel[3] * 9
  sum += pesel[4] * 1
  sum += pesel[5] * 3
  sum += pesel[6] * 7
  sum += pesel[7] * 9
  sum += pesel[8] * 1
  sum += pesel[9] * 3
  sum %= 10
  sum = 10 - sum
  sum %= 10
  sum == pesel[10]
end
if ARGV[0].to_s.strip == ''
  puts 'Podaj PESEL jako argument'
else
  pesel = ARGV[0].split('').map(&:to_i) # { |x| x.to_i }
  if checksum?(pesel)
    puts "#{get_day(pesel)}.#{get_month(pesel)}.#{get_year(pesel)}, #{get_sex(pesel)}"
  else
    puts 'PESEL nie jest poprawny'
  end
end
