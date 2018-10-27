def vowel_count(word)
  vowel = 0
  word.split('').each do |char|
    if ['a', 'e', 'i', 'o', 'u', 'y'].include?(char)
      vowel += 1
    end
  end
  vowel
end
