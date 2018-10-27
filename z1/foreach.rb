require 'pry-byebug'

def foreach_with_index(array)
  i = 0
  while i < array.length
    yield(array[i], i)
    i += 1
  end
end

foreach_with_index([1, 2, 3]) do |x, i|
  puts i + x * 2
end
