def accum(str)
  new_str = ''
  splitted_str = str.upcase.split('')
  splitted_str.each_with_index do |elem, i|
    new_str << elem
    elem.downcase!
    i.times do
      new_str << elem
    end
    new_str << '-'
  end
  new_str[0..-2]
end
