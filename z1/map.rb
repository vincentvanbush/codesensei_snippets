def map(array)
  new_array = []
  array.each do |e|
    transformed_element = yield(e)
    new_array << transformed_element
  end
  new_array
end

def sum(array)
  calculated_sum = 0
  array.each do |e|
    transformed_element =
      if block_given?
        yield(e)
      else
        e
      end
    calculated_sum += transformed_element
  end
  calculated_sum
end