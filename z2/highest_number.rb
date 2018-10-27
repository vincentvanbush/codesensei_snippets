# The function accepts an integer and converts the order of its digits to
# obtain the highest possible integer

# @param Int
# @return Int
def highest_number(number)
  number = number.to_s.split('')
  number.sort!.reverse!
  result = number.join
  result.to_i
end
