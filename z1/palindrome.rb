def palindrome?(str)
  downcased_str = str.gsub(/\s+/, '').downcase
  downcased_str.reverse == downcased_str
end
