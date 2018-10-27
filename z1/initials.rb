def initials(fullname)
  fullname = fullname.strip
  fullname.split(/[\s\_\-]+/).map { |el| el[0].upcase }.join
end

puts initials(gets)
