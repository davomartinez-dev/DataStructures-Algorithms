require 'byebug'

def transpose(_string)
  i = 0
  @count = 0
  while i < _string.length - 1
    @count += 1 if _string[i] == 'g' && _string[i + 1] == 'n'
    i += 1
  end

  while @count > 0
    i = 0
    while i < _string.length - 1
      if _string[i] == 'g' && _string[i + 1] == 'n'
        _string[i] = 'n'
        _string[i + 1] = 'g'
        @count -= 1
        @count += 1 if i > 0 && _string[i] == 'n' && _string[i - 1] == 'g'
      end
      i += 1
    end
  end
  _string
end

# Time Complexity -> O(n2)
# Space Complexity -> O(1)

puts transpose('he was searchign on Bign for signign kigns')
# transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

# puts transpose('rignadingdiggn!')
puts transpose('rignadingdiggn!')
# # => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# # => nnnnnnnnngggggggg
